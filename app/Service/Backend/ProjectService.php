<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Service\Backend;

use Illuminate\Support\Facades\DB;
use App\Model\Users;
use App\Model\Loan;
use App\Model\LoanApply;
use App\Model\LoanApplyProject;
use App\Model\Authentic;
use App\Model\Project;
use App\Model\LenderPayment;
use App\Model\BorrowerFundRecord;
use App\Service\SmsService;
use App\Service\Fuiou\FyLoanToBorrowerService;
use Illuminate\Support\Facades\Log;

/**
 * 标的管理
 *
 * @author mashouchao
 */
class ProjectService {

    //状态，1/审核中 2/募集中 3/满标 4/流标 5/已放款 6/还款结束
    //审核中、待审核
    const STATUS_PENDING = 1;
    //募集中
    const STATUS_RAISEING = 2;
    //满标
    const STATUS_SUCCESS = 3;
    //流标
    const STATUS_FAILURE = 4;
    //已放款
    const STATUS_GRANT = 5;
    //还款结束
    const STATUS_FINISH = 6;



    /**
     * 合并标的（散标）
     * @param string $ids 当前页码
     * @param string $projectInfo 当前页码
     * @throws
     */
    public function ProjectMerge($ids,$projectInfo) {
        // TODO 高并发的时候这里合标会出问题，当后台发起合标，执行到此，而安卓苹果端也来更新project散标，这里进行合标过后，散标更新
        // TODO 后没有把合标的价格更新，此时会出问题。
        // TODO 这里防止合并标的前，散标被继续投标，合标的已投金额此刻重新核算下sum()

        //生成合标编号,HB180516122232
        $HBNO="HB".substr(date("Y"),-2).date("His");

        Log::info(__FUNCTION__.__LINE__.",HB serial number is:".$HBNO);
        //把合标的编号加入数组中
        $projectInfo['serial_no']=$HBNO;
        $mergeId=Project::insertGetId($projectInfo);
        if(!$mergeId){
            Log::info(__FUNCTION__.__LINE__.",HB create failed,projectInfo=",$projectInfo);

            throw  new \Exception("生成合标失败{1}");
        }
        Log::debug(__FUNCTION__.__LINE__.",insert id=$mergeId and origin ids=$ids");
        if(substr($ids,-1)==','){
            $ids=substr($ids,0,-1);
        }
        Log::debug(__FUNCTION__.__LINE__.",final ids=$ids");

        //给散标加上合标（merge_id）,之后合标字段为null的才能继续合标

        $result=Project::whereRaw("id IN ($ids) and merge_id IS NULL")->update(['merge_id' => $mergeId]);
        if(!$result){

            Log::info(__FUNCTION__.__LINE__.",update project set merge_id=$mergeId error,ids=$ids,result=$result");
            throw new \Exception("数据更新失败{2}");
        }else{
            $idar=explode(',',$ids);
            if(count($idar)!=$result) {

                Log::info(__FUNCTION__ . __LINE__ . ",update project error,result not equal ids's length,result=$result,idar=",$idar);
                throw new \Exception("数据更新失败,没有完全更新{3}");
            }
        }
        Log::debug(__FUNCTION__.__LINE__.",update project with merge_id=$mergeId");

        //重新统计所有散标的已投金额(浏览器数据不一定准，这里不能买坑)。读表为[tr]
        $res=Project::selectRaw('sum(loan_amount) as loan_amount, sum(surplus_amount) as surplus_amount')->where('merge_id',$mergeId)->get();
        Log::debug(__FUNCTION__.__LINE__.",select more amount =",$res);

        if(!$res[0]) {

            Log::info(__FUNCTION__ . __LINE__ . ",get [count(loan_amount) as loan_amount,count(surplus_amount) as surplus_amount] error,res=".print_r($res,true));
            throw new \Exception("重新统计数据失败{4}");

        }else if(!($result=Project::where('id' ,$mergeId)->update(['loan_amount'=> $res[0]['loan_amount'],'surplus_amount'=>$res[0]['surplus_amount'] ]))){

            Log::info(__FUNCTION__ . __LINE__ . ",get [sum(loan_amount) as loan_amount, sum(surplus_amount) as surplus_amount] error,res=".print_r($result,true));
            throw new \Exception("更新合标总金额，剩余金额失败{5}");
        }

    }

    /**
     * 合标列表
     *
     * @param int $page 当前页码
     * @param int $pageSize  每页条数
     * @param string $field  查询字段
     * @param string $keyword 查询字段的值
     *
     * @return string token
     */
    public function getMergeList($page,$pageSize,$field,$serial_no){

        $mdb=Project::where('type','2');
        if ($field === 'merge_num' && $serial_no){
            $mdb=$mdb->where( 'serial_no',$serial_no);
        }
        $data['page']=['total'=> $mdb->count() ,'current'=>$page];

        $mdb=$mdb->offset(($page-1)*$pageSize)->limit($pageSize) ;

        $data['list']=$mdb->get();
        foreach ($data['list'] as $k => $v) {
            //获取合标对应的所有散标
             $data['list'][$k]['project']=Project::where('merge_id',$v->id)->get();

            foreach ($data['list'][$k]['project'] as $k1 => $v1) {
                $aid = LoanApplyProject::where('pid',$v1->id)->value('aid');
                $uid= LoanApply::find($aid)->uid;
                $mobile =($res=Users::where('id',$uid)->first()) ? $res['mobile']:'';
                $data['list'][$k]['project'][$k1]->merge_id_hb=$v1->merge_id? Project::where('id',$v1->merge_id)->value('serial_no'):'';
                $data['list'][$k]['project'][$k1]->mobile=$mobile;
            }
        }

        return $data;

    }


    /**
     * 散标列表
     *
     * @param int $page 当前页码
     * @param int $pageSize  每页条数
     * @param string $field  查询字段
     * @param string $keyword 查询字段的值
     *
     * @return string token
     */
    public function ProjectList($page, $pageSize, $field = "", $keyword = "") {

        Log::info(__FUNCTION__.__line__.",get project list start,with page=$page,pageSize=$pageSize,field=$field,keyword=$keyword");
        if ($keyword && $field) {
            if($field=='mobile'){//手机号要使用users表来搜索
                //统计分页数据
                $sql='select p.* from project as p left join loan_apply_project as lap on p.id=lap.pid left join loan_apply as la on la.id=lap.aid left join users as u on u.id = la.uid'.
                    ' where p.type=1 and u.mobile=%s  limit %s,%s';
                $sql=sprintf($sql,$keyword,($page-1)*$pageSize,$pageSize);

                Log::info(__FUNCTION__.__line__.",get data by mobile,and sql=$sql");
                $datas['list'] = DB::select($sql);
                //统计总数量
                $sqlCount='select count(id) as num from (select p.id from project as p left join loan_apply_project as lap on p.id=lap.pid left join loan_apply as la on la.id=lap.aid'.
                    ' left join users as u on u.id = la.uid where p.type=1) as f';
                $total=DB::select($sqlCount)[0]->num;

            }else if($field=='project_num'){//根据序列号来查询
                $mdb = Project::where('type', '1')->where('serial_no',$keyword);
                $total = $mdb->count();
                $datas['list'] = $mdb
                    ->skip(($page - 1) * $pageSize)
                    ->orderBy('updated_at', 'desc')
                    ->take($pageSize)->get();
            }

        }else {
            $mdb = Project::where('type', '1');
            $total = $mdb->count();
            $datas['list'] = $mdb->skip(($page - 1) * $pageSize)->orderBy('created_at', 'desc')->take($pageSize)->get();
        }

        foreach ($datas['list'] as $k => $v) {
            // 通过project表id获取对应的loan_apply表aid
            $loan_apply_id = LoanApplyProject::where('pid', $v->id)->value('aid');
            // 获取借款人申请记录（包含借款人编号，和申请的产品编号）
            $loan_apply = LoanApply::where('id', $loan_apply_id)->first();

            //没有申请借款数据直接跳过
            if (!$loan_apply) {continue;}

            // 合标编号
            $datas['list'][$k]->merge_serial_no =$v->merge_id ? Project::where('id', $v->merge_id)->value('serial_no'):'';

            // 用户信息
            $datas['list'][$k]->users = Users::where('id', $loan_apply->uid)->first();
            // 借款的产品（闪电贷等）
            $datas['list'][$k]->loan_project = Loan::where('id', $loan_apply->loan_id)->first();
            // 借款的产品（闪电贷等）
            $datas['list'][$k]->loan_apply = $loan_apply;
            // 借款人实名信息
            $datas['list'][$k]->authentic = Authentic::where('uid', $loan_apply->uid)->first();
            // 借款人信息
            $datas['list'][$k]->borrower = DB::table('borrower')
                    ->join('users', 'users.id', '=', 'borrower.uid')
                    ->select('users.mobile', 'borrower.*')
                    ->where('borrower.uid', $loan_apply->uid)
                    ->first();
        }

        $datas['page'] = ["total" => $total, "current" => (int)$page, "pageSize" => (int)$pageSize];

    return $datas;
    }

    /**
     * 生成标的，编辑标的信息
     *
     * @param int $params  编辑参数
     *
     * @return string token
     */
    public function ProjectEdit($params) {
        $project = Project::find($params['id']);
        if (!$project) {
            return false;
        }
        $project->title = $params['title'];
        $project->basis_rate = $params['basis_rate'] * 100;
        $project->introduce = $params['introduce'];
        $project->loan_term = $params['loan_term'];
        //起投金额，录入单位元，入库单位分
        $project->lowest_amount = $params['lowest_amount'] * 100;
        $project->profit_calcula = $params['profit_calcula'];
        $project->raise_term = $params['raise_term'];
        $project->release_time = time();
        $project->repay_method = $params['repay_method'];
        //递增金额，录入单位元，入库单位分
        $project->quota_unit = $params['increase_money'] * 100;
        $project->is_novice = $params['is_novice']==1?1:0;   // 普通标和新手标
        $project->status = self::STATUS_RAISEING;       // 筹集中
        $project->lock_day = $params['lock_day'];       // 默认散标锁定期为30天

        Log::info(__FUNCTION__.__LINE__.',create project with data=',$project);

        DB::beginTransaction();
        //更新借款申请状态
        if (!$project->save()) {
            Log::info(__FUNCTION__.__LINE__.',project save error');
            DB::rollBack();
            return false;
        }
        //更新借款申请状态
        $loan_id = ($res=LoanApplyProject::where('pid', $params['id'])) ?  $res->value('aid'):0;
        LoanApply::where('id', $loan_id)->update(['status' => LoanService::STATUS_RAISEING]);
        DB::commit();

        $loanApply = LoanApply::where('id',$loan_id)->first();

        //发送短信通知
        $username = Authentic::where('uid', $loanApply->uid)->value('full_name');
        //获取借款人手机号码
        $mobile = Users::find($loanApply->uid)->mobile;

        $smsService = new SmsService();
        $text = str_replace(['#username#'], [$username], $smsService->tpl['centralization']);   //替换模板内容
        Log::debug(__FUNCTION__.__LINE__.",start send message text=$text");
        $smsService->noticeSms($mobile, $text);
        return true;
    }

    /**
     * 满标审核通过，修改标的状态,为已放款,修改那条借款的状态为已放款
     *
     * @param int $id  标的编号
     *
     * @return string token
     */
    public function ProjectPass($id) {

        Log::info(__FILE__ .__FUNCTION__.__LINE__.',pass start pid='.$id);

        if(!Project::where('id', $id)->update(['status' => self::STATUS_GRANT, 'grant_time' => time()])){
            Log::alert(__FILE__ .__FUNCTION__.__LINE__.',project update error ,id='.$id);
            return ['code'=> -1,'msg'=>'更新标的状态为放款&放款时间失败'];
        }

        //更新回款时间
        //借款期限，单位月
        $loan_term = Project::where('id', $id)->value('loan_term');
        //当前时间+借款期限+1 = 还款时间
        $return_time = strtotime("+1 days", strtotime("+$loan_term months"));
        Log::info('---to real time '.date('Y-m-d H:i:s', $return_time));

        if (!LenderPayment::where('pid', $id)->update(['repay_time' => $return_time])) {

            Log::alert(__FILE__ .__FUNCTION__.__LINE__.',LenderPayment update error return_time='.$return_time.',id='.$id);
            return ['code'=> -1,'msg'=>'更新出借人回款时间失败'];
        }

        //通过project表id获取对应的loan_apply表aid
        $loan_apply_id = LoanApplyProject::where('pid', $id)->value('aid');

        //修改最初的借款申请，为已放款
        if (!LoanApply::where('id', $loan_apply_id)->update(['status' => 6, 'loan_time' => time()])) {

            Log::alert(__FILE__ .__FUNCTION__.__LINE__.',LoanApply update error ');
            return ['code'=> -1,'msg'=>'修改最初借款申请为已放款，失败'];
        }

        //获取借款人申请记录（包含借款人编号，和申请的产品编号）
        $loan_apply = LoanApply::where('id', $loan_apply_id)->first();

        //添加借款人资金记录
        $borrowerFundRecord = new BorrowerFundRecord();
        $borrowerFundRecord->uid = $loan_apply->uid;
        $borrowerFundRecord->amt = $loan_apply->quota;
        $borrowerFundRecord->deal = 1;
        $borrowerFundRecord->entry = 1;
        Log::info(__FILE__ .__FUNCTION__.__LINE__.',add borrower record with borrowerFundRecord='.sprintf($borrowerFundRecord,true));
        if (!$borrowerFundRecord->save()) {

            Log::alert(__FILE__ .__FUNCTION__.__LINE__.'$borrowerFundRecord.save() error ');
            return ['code'=> -1,'msg'=>'添加借款人资金记录失败'];
        }

        $fyLoanToBorrower = new FyLoanToBorrowerService();
        $fyLoanToBorrower->__set('pid', $id);

        //资金划拨给借款人
        if (true !== ( $res = $fyLoanToBorrower->loanToBorrower())  ) {

            Log::alert(__FILE__ .__FUNCTION__.__LINE__.'$fyLoanToBorrower.loanToBorrower() error ,res='.$res);
            return ['code'=> -1,'msg'=> $res];
        }

        //发送短信通知
        $username = Authentic::where('uid', $loan_apply->uid)->value('full_name');
        //获取借款人手机号码
        $mobile = Users::find($loan_apply->uid)->mobile;

        $smsService = new SmsService();
        $text = str_replace(['#username#'], [$username], $smsService->tpl['raiseSuccess']);   //替换模板内容
        $res=$smsService->noticeSms($mobile, $text);

        Log::info(sprintf(__FILE__ .'>'.__FUNCTION__.'>'.__LINE__.'>start send message ,mobile=%s,text=%s,res=%s',$mobile,$text,print_r($res,true)));

        return ['code'=> 0];
    }

}
