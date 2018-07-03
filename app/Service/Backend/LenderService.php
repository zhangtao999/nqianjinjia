<?php

namespace App\Service\Backend;

//出借人service类

use App\Model\LenderPayment;
use App\Model\LenderInvest;
use App\Model\Authentic;
use App\Model\Users;
use App\Model\FyAccount;
use App\Model\Project;
use App\Model\WithdrawCashReview;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;


/**
 * 出借管理
 *
 * @author mashouchao
 */
class LenderService {


    /**
     * 提现记录列表
     *
     * @param int $page 当前页码
     * @param int $pageSize 每页条数
     * @param string $field 查询字段
     * @param string $keyword 查询字段的值
     * @param string $startTime 起始时间
     * @param string $endTime 结束时间
     *
     * @return string token
     */
    public function with_draw_list($page, $pageSize, $field = "", $keyword = "", $startTime = '', $endTime = '')
    {
        $mdb = new WithdrawCashReview();

        if ($keyword && $field == 'mobile') {
            $uid=Users::where('mobile',$keyword)->value('id');
            $mdb = $mdb->where('uid', $uid);
        }
        if ($startTime && $endTime) {
            $mdb = $mdb->where("created_at", '>', $startTime);
            $mdb = $mdb->where("created_at", '<', $endTime);
        }

        $total         = $mdb->count();
        $datas['list'] = $mdb->offset(($page - 1) * $pageSize)->limit($pageSize)->orderBy('created_at', 'desc')->get();
        //Log::info('data list=',$datas['list']);

        foreach ($datas['list'] as $k => $v) {

            // 计数器
            $datas['list'][$k]['num']=$k+1;

            //获取鉴权表记录
            $datas['list'][$k]['username'] = ($res=Authentic::where('uid', $v->uid)->first())?$res['full_name']:'';
            if(!$datas['list'][$k]['username']){
                $datas['list'][$k]['username']=FyAccount::where('uid',$v->uid)->value('full_name');
            }

            $datas['list'][$k]['mobile']   = ($res=Users::where('id', $v->uid)->first())?$res['mobile']:'';
        }

        $datas['page'] = ["total" => $total, "current" => $page, "pageSize" => $pageSize];

        return $datas;

    }

    /**
     * 出借人出借记录列表
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
    public function invest_list($page, $pageSize, $field = "", $keyword = "",$startTime='', $endTime='') {
        $userId=null;
        Log::info(__FILE__.">".__FUNCTION__.'>'.__LINE__.' ,start get list with '.sprintf('page=%s,pageSize=%s,field=%s,keyword=%s,startTime=%s,endTime=%s',
                $page ,$pageSize, $field  ,$keyword ,$startTime , $endTime));
        $mdb = new LenderInvest();
        $where='';
        // 检测搜索条件   关键词为空则忽略所有条件
        if($keyword) {
            if ($field == 'mobile') {
                $userId=Users::where('mobile',$keyword)->first();
                if(!$userId){
                    return ['page' =>["total" => 0, "current" => $page, "pageSize" => $pageSize],'list'=>[]];
                }
                $mdb=$mdb->where('uid',$userId['id']);
                $where.=" where uid=".$userId['id'];
            }else if($field==='serial_no'){ //根据标的编号来搜索
                $pro=Project::where('id',$keyword)->first();
                if(!$pro){
                    return ['page' =>["total" => 0, "current" => $page, "pageSize" => $pageSize],'list'=>[]];
                }
                $mdb=$mdb->where('pid',$pro['id']);
                $where.=" where pid=".$pro['id'];

            }
        }
        if($startTime){
            $mdb=$mdb->where("created_at",'>',$startTime);
            $where.=" and created_at > $endTime";
        }
        if($endTime){
            $mdb=$mdb->where("created_at",'<',$endTime);
            $where.=" and created_at < $endTime";
        }

        Log::info(__FUNCTION__.'>'.__LINE__.',get lender_invest list ,where='.$where);
        $datas['list']  = $mdb->selectRaw('serial_num,MAX(uid) AS uid, SUM(amt) AS amt,MAX(rate) AS rate,MAX(ppid) as ppid,MAX(pid) as pid,MAX(debt_status) AS debt_status,MAX(created_at) as created_at')
            ->orderBy('created_at', 'desc')
            ->groupBy('serial_num')
            ->offset(($page - 1) * $pageSize)
            ->limit($pageSize)->get();

        $res=DB::select('select count(serial_num) as total from ( select serial_num from lender_invest '.$where.' group by serial_num) as tb');
        $total=$res[0]->total;

        //Log::info(__FILE__.">".__FUNCTION__.'>'.__LINE__.' ,data from mysql=',$datas);
        foreach ($datas['list'] as $k=>$v) {
            // 获取散标或者合标记录
            $datas['list'][$k]->num=$k+1;
            $datas['list'][$k]['project']   = Project::where('id', $v->ppid?$v->ppid:$v->pid)->first();
            // 标的状态为满标审核通过后(已放款5)或者完成（已回款）6，则需要计算回款时间
            if( $datas['list'][$k]['project'] && (($R=intval($datas['list'][$k]['project']['status'])) ===5 ||$R === 6)) {
                try {
                    // 回款时间=发布时间+期数*（30+1）*86400
                    $datas['list'][$k]['project']['back_money_time']    =   strtotime("+1 days", strtotime("+{$datas['list'][$k]['project']['loan_term']} months"));
                    $datas['list'][$k]['project']['release_time']       =   $datas['list'][$k]['project']['release_time'] + 86400; // 起息时间=发布时间+1D
                } catch (\Exception $e) {
                    Log::info(__FUNCTION__ . __LINE__ . ',add back_time error='.$e->getMessage());
                }
            }
            // 获取鉴权表记录
            $datas['list'][$k]['authentic'] = Authentic::where('uid', $v->uid)->first();
            $datas['list'][$k]['users']     = $userId ? $userId:Users::where('id', $v->uid)->first();
            if( !$datas['list'][$k]['authentic'] ){

                $datas['list'][$k]['uname'] = FyAccount::where('uid', $v->uid)->value('full_name');
            }

        }

        $datas['page'] = ["total" => $total, "current" => $page, "pageSize" => $pageSize];

        return $datas;
    }

    // 审核提现操作
    public function with_draw_pass($id, $pass, $reason)
    {
        Log::info(__FUNCTION__ . __LINE__ . ',start with draw pass,id=' . $id . ',pass=' . $pass . ',reason=' . $reason);

        if (!WithdrawCashReview::where('id',$id)->update(['review_status'=>$pass=='yes'?2:3,'refuse_reason'=>$reason,'review_person'=>'admin','review_date'=>date("Y-m-d H:i:s")])) {
            Log::alert(__FUNCTION__ . __LINE__ .', update with_draw_review table error,');
            throw new \Exception('更新数据失败');
        }
    }
}
