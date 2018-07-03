<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Service\Backend;

use App\User;
use Illuminate\Support\Facades\DB;
use App\Model\Loan;
use App\Model\LoanApply;
use App\Model\LoanApplyProject;
use App\Model\Authentic;
use App\Model\Users;
use App\Model\Borrower;
use App\Model\Project;
use App\Model\BorrowerRepay;
use App\Service\SmsService;
use Illuminate\Support\Facades\Log;

/**
 * 借款管理
 *
 * @author mashouchao
 */
class LoanService {

    //申请状态，1/已申请 2/审核通过 3/审核失败 4/筹集中 5/放款中 6/已借完 7/借款失败
    //已申请、待审核
    const STATUS_PENDING = 1;
    //审核通过
    const STATUS_APPROVE = 2;
    //审核失败
    const STATUS_REJECT = 3;
    //筹集中
    const STATUS_RAISEING = 4;
    //放款中
    const STATUS_LOANING = 5;
    //已借完
    const STATUS_END = 6;
    //借款失败
    const STATUS_FAILED = 7;

    /**
     * 借款列表
     *
     * @param int $page 当前页码
     * @param int $pageSize  每页条数
     * @param string $field  查询字段
     * @param string $keyword 查询字段的值
     * @param string $startTime 起始时间
     * @param string $endTime 结束时间
     *
     * @return string token
     */
    public function LoanList($page, $pageSize, $field = "", $keyword = "",$startTime='', $endTime='') {

        Log::info(__FILE__.">".__FUNCTION__.'>'.__LINE__.' start get list with '.sprintf('page=%s,pageSize=%s,field=%s,keyword=%s,startTime=%s,endTime=%s',
                $page ,$pageSize, $field  ,$keyword ,$startTime , $endTime));

        $mdb=DB::table('loan_apply')
            ->select('loan_apply.*','users.mobile')
            ->join('users', 'users.id', 'loan_apply.uid');
            // ->join('loan_apply_project', 'loan_apply.id', 'loan_apply_project.aid');

        //检测搜索条件
        if($keyword) {// 关键词为空则忽略所有条件
            if ($field == 'mobile') {

                $mdb = $mdb->where('users.mobile', $keyword);
                //$where[$field]=$keyword;
            } else if ($field == 'serial_num') {

                $mdb = $mdb->where('loan_apply.id', $keyword);
            }
        }

        if($startTime && $endTime){
            $mdb=$mdb->where("loan_apply.created_at",'>',$startTime);
            $mdb=$mdb->where("loan_apply.created_at",'<',$endTime);
        }

        $total = $mdb->count();
        $datas['list'] = $mdb->offset(($page - 1) * $pageSize)->limit($pageSize)->orderBy('loan_apply.created_at', 'desc')->get();

        foreach ($datas['list'] as $k => $v) {

            //借款的产品（闪电贷等）
            $datas['list'][$k]->loan_project = Loan::where('id', $v-> loan_id)->first();


            //审核通过，形成的标的编号，对应project表主键
            $datas['list'][$k]->pid = ($res=LoanApplyProject::where('aid', $v->id))?$res->value('pid') :'';

            //借款人姓名，手机号码
            $datas['list'][$k]->username = empty(Authentic::where('uid', $v->uid)) ? '' : Authentic::where('uid', $v->uid)->value('full_name');

            //借款人信息
            $datas['list'][$k]->borrower = Borrower::where('uid', $v->uid)->first();
            //借款人实名认证的基础信息
            $datas['list'][$k]->base = Authentic::where('uid', $v->uid)->first();
        }

        $datas['page'] = ["total" => $total, "current" => $page, "pageSize" => $pageSize];

        //Log::debug(__FUNCTION__.__LINE__.',get loan list end ,result='.json_encode($datas));

        return $datas;
    }

    //序列化标的id
    private function serial_project_no($ids){
        if(count($ids)<1){
            return '';
        }
        $res='(';
        foreach ($ids as $v){

            $res.=$v['id'].',';
        }
        return substr($res,0,-1).')';


    }

    /**
     * 还款列表
     *
     * @param int $page 当前页码
     * @param int $pageSize  每页条数
     * @param string $field  查询字段
     * @param string $keyword 查询字段的值
     *
     * @return string token
     */
    public function RepaymentList($page, $pageSize, $field = "", $keyword = "",$startTime,$endTime) {
        Log::info(__FUNCTION__.__LINE__.'，get repayment list start with params=',['page'=>$page,'pageSize'=>$pageSize,'field'=>$field,'keyword'=>$keyword,'startTime'=>$startTime,'endTime'=>$endTime]);
        $mdb= BorrowerRepay::select(DB::raw('uid,pid,lid,SUM(corpus) corpus,SUM(interest) interest,SUM(overdue_interest) overdue_interest,MAX(period) peroid,MAX(created_at) created_at'));
        if($keyword){
            if($field=='mobile'){
                $pids=Project::select('project.id')
                    ->leftjoin('loan_apply_project','loan_apply_project.pid','project.id')
                    ->leftjoin('loan_apply','loan_apply.id','loan_apply_project.aid')
                    ->leftjoin('users','users.id','loan_apply.uid')
                    ->where('users.mobile',$keyword)->get()->toArray();
                if(($res=$this->serial_project_no($pids))){
                    $mdb->whereRaw('pid in '.$res);
                }else{
                    return ['page' => ["total" => 0, "current" => 1, "pageSize" => 0],'list'=>[]];
                }
            }
        }

        // 借款放款时间
        if($startTime && $endTime){
            $pids=Project::select('project.id')
                ->where('grant_time','>',strtotime($startTime))
                ->where('grant_time','<',strtotime($endTime))
                ->get()
                ->toArray();

            if(($res=$this->serial_project_no($pids))){
                $mdb->whereRaw('pid in '.$res);
            }else{
                return ['page' => ["total" => 0, "current" => 1, "pageSize" => 0],'list'=>[]];
            }
            // ($res=$this->serial_project_no($pids))?$mdb->whereRaw('pid in '.$res):'';
        }

        $datas['list'] =$mdb
                ->groupBy('pid', 'uid', 'lid')
                ->orderBy('created_at', 'desc')
                ->get();

        $total = count($datas['list']);
        foreach ($datas['list'] as $k => $v) {

            //获取借款信息
            $project = Project::find($v->pid);
            //序号
            $datas['list'][$k]['num'] =$k+1;
            //借款编号
            $datas['list'][$k]['order_no'] =($res= LoanApply::select('order_no')
                ->leftjoin('loan_apply_project','loan_apply_project.aid','loan_apply.id')
                ->leftjoin('project','project.id','loan_apply_project.pid')
                ->where('project.id',$v->pid)
                ->first())? $res->order_no:'';
            //总共金额
            $datas['list'][$k]['should_pay'] = $v->corpus+$v->interest+$v->overdue_interest ;
            //放款时间
            $datas['list'][$k]['grant_time'] = $project?date('Y-m-d H:i:s', $project->grant_time):'';
            //查找当前pid下的所有未还金额
            $notPay = BorrowerRepay::select(DB::raw('pid,SUM(corpus) corpus, SUM(interest) as interest,SUM(overdue_interest) overdue_interest,MAX(period) peroid'))
                ->groupBy('pid')
                ->whereRaw(" pid={$v['pid']} and status in (1,4) ")
                ->get()->toArray();
            if($notPay){
               $notPay=$notPay[0];
                //应还金额
                $datas['list'][$k]['not_pay'] = $notPay?$notPay['corpus']+$notPay['interest']+$notPay['overdue_interest']:'';
            }else{
                $datas['list'][$k]['not_pay'] = 0;
            }
            //未还和逾期未还都统计为 剩余期数
            $sqlCount   =   'select count(id)as num from borrower_repay where pid='.$v['pid'].' and status in (1,4)';
            $term   =   DB::select($sqlCount)[0]->num;
            //剩余期限
            $datas['list'][$k]['left_term'] = $term;
            //还款期限
            $datas['list'][$k]['term'] = $v->period;
            //还款人，也就是借款人
            $datas['list'][$k]['username'] = Authentic::select('full_name')->where('uid', $v['uid'])->first()['full_name'];
            //获取手机号
            $datas['list'][$k]['mobile'] = Users::select('mobile')->where('id', $v['uid'])->first()['mobile'];
            // 还款状态，1还款中，2已还清，3已逾期
            $borrower_ = BorrowerRepay::select('repay_time','status')->where('pid',$datas['list'][$k]['pid'])->orderBy('repay_time','desc')->first();
            // 最后一期的还款时间小于当前时间，则显示预期
            if($borrower_->status === 2){
                $datas['list'][$k]['repay_status']=2;
            }else if(($borrower_1 = BorrowerRepay::select('repay_time','status')->where('pid',$datas['list'][$k]['pid'])->whereRaw('status in (4)')->orderBy('repay_time','desc')->first())){
                // 取到最近还款的一起，看看时间有没有逾期
                if($borrower_1->repay_time < time()){
                    $datas['list'][$k]['repay_status']=3;
                    // 逾期了，只统计预期的金额
                    $sqlCount = 'select sum(overdue_interest)as num from borrower_repay where pid='.$v['pid'].' and status in (4)';
                    $amt = DB::select($sqlCount)[0]->num;
                    $datas['list'][$k]['pass_amount'] = $amt;
                }else{
                    $datas['list'][$k]['repay_status'] = 1;
                }
            }else{
                $datas['list'][$k]['repay_status'] = 1;
            }
        }
        $datas['page'] = ["total" => $total, "current" => $page, "pageSize" => $pageSize];
        Log::debug(__FUNCTION__.__LINE__.',get repayment list end ,with data=',$datas);
        return $datas;
    }

    /**
     * 某条还款的详情列表
     *
     * @param int $pid 标的编号
     * @param int $page 当前页码
     * @param int $pageSize  每页条数
     * @param string $field  查询字段
     * @param string $keyword 查询字段的值
     *
     * @return string token
     */
    public function RepaymentDetailList($pid, $page, $pageSize) {
        $datas['list'] = BorrowerRepay::where('pid', $pid)
            ->orderBy('period', 'asc')
            ->select(DB::raw("id,uid,pid,lid,corpus ,interest ,period,`status`,FROM_UNIXTIME(repay_time,'%Y-%m-%d') repay_time,if(overdue_date=0,'/',FROM_UNIXTIME(overdue_date,'%Y-%m-%d') ) as  overdue_date,overdue_day,overdue_interest, if(overdue_date=0,'/',FROM_UNIXTIME(overdue_repay_time,'%Y-%m-%d') ) as overdue_repay_time ,repay_type"))
            ->get();
        $total = BorrowerRepay::where('pid', $pid)->count();

        $datas['page'] = ["total" => $total, "current" => $page, "pageSize" => $pageSize];

        return $datas;
    }

    /**
     * 审核借款申请
     *
     * @param int $id loan_apply 主键Id
     * @param bool $isApprove true审核通过，false审核不通过
     * @param string $reject_note 审核不通过理由
     *
     * @return boolean  审核结果
     */
    public function approve($id, $isApprove, $reject_note) {
        Log::info(__FUNCTION__.__LINE__.',approve pass with params=',['id'=>$id,'isApprove'=>$isApprove,'reject_note'=>$reject_note]);

        $loanApply = LoanApply::find($id);
        if (empty($loanApply))
            return false;

        // 修改审核状态
        $loanApply->status      =    $isApprove ? self::STATUS_APPROVE : self::STATUS_REJECT;

        // 审核通过的时候生成借款编号，借款编号是一对多个借款
        $loanApply->order_no    =    "JK".substr(date("Y"),-2).date("mdHis").rand(1000,9999);

            // 发送短信通知
        $username = Authentic::where('uid', $loanApply->uid)->value('full_name');
        // 获取借款人手机号码
        $mobile = Users::find($loanApply->uid)->mobile;

        if ($isApprove) {
            // 审核通过
            $loanApply->adopt_time = time();
        } else {
            // 审核不通过
            $loanApply->fail_time = time();
            $loanApply->fail_reason = $reject_note;

            if ($loanApply->save()) {
                $smsService = new SmsService();
                $text = str_replace(['#username#'], [$username], $smsService->tpl['auditFailure']);   //替换模板内容
                $smsService->noticeSms($mobile, $text);
            }

            return true;
        }

        DB::beginTransaction();
        if (!$loanApply->save()) {
            DB::rollBack();
            return false;
        }

        // 借款申请通过之后，生成一笔待审核标的
        $project = new Project();
        $SBNO="SB".substr(date("Y"),-2).date("mdHis").rand(1000,9999);
        // 散标编号
        $project->serial_no = $SBNO;
        // 默认标的名称
        $project->title = "钱进家";
        // 月利率转成年化利率
        $project->basis_rate = $loanApply->rate * 12;
        $project->extra_rate = 0;
        // 借款金额
        $project->loan_amount = $loanApply->quota;
        // 剩余金额
        $project->surplus_amount = $loanApply->quota;
        // 借款期限
        $project->loan_term = $loanApply->term;
        // 满标时间
        $project->full_scale_time = $loanApply->raise_time;
        // 标的状态，1/审核中 2/募集中 3/满标 4/流标 5/已放款 6/还款结束
        $project->status = 1;
        // Type默认为1，表示散标
        $project->type = 1;

        if (!$project->save()) {
            DB::rollBack();
            return false;
        }

        // 建立借款申请和标的关联关系
        $loanApplyProject = new LoanApplyProject();
        $loanApplyProject->aid = $id;
        $loanApplyProject->pid = $project->id;
        if (!$loanApplyProject->save()) {
            DB::rollBack();
            return false;
        }
        DB::commit();

        $smsService = new SmsService();
        // 替换模板内容
        $text = str_replace(['#username#'], [$username], $smsService->tpl['auditSuccess']);
        $res=$smsService->noticeSms($mobile, $text);

        Log::info(__FUNCTION__.__LINE__.',loan pass,create project end with send message result=',$res);
        return true;
    }

}
