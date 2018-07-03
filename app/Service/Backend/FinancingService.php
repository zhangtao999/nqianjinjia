<?php

namespace App\Service\Backend;

use App\Model\DebtAssignment;
use App\Model\LenderInvest;
use App\Model\Project;
use App\Model\Users;
use App\Model\FyAccount;
use Illuminate\Support\Facades\DB;

/*
 * 理财管理
 * by mengxiang
 */
class FinancingService
{
    private $project; //产品表
    private $users; //用户表
    private $fyaccount; //富有账户表

    public function __construct()
    {
        # 临时修改,不会写入到配置
        config(['database.connections.mysql.strict' => false]);
        $this->project = new Project();
        $this->users = new Users();
        $this->fyaccount = new FyAccount();
    }

    /*
     * 债权转让列表
     * by mengxiang
     */
    public function  getDebtList($page,$pageSize,$field,$keyword)
    {
        if($field == 'mobile' && !empty($keyword)){
            $uid = $this->users->getUid($keyword);
        }
        $total = 0;
        $db = LenderInvest::selectRaw('lender_invest.debt_no,debt_assignment.from_uid,debt_assignment.to_uid,amt,
        MAX(pid) AS pid,MAX(ppid) AS ppid,MAX(rate) AS rate,MAX(debt_status) AS debt_status,left_terms AS debt_periods')
            ->leftJoin('debt_assignment', 'debt_assignment.from_lender_invest_num', 'lender_invest.serial_num')
            ->whereIn('debt_status', [1, 2]);
        if($keyword) {
            if ($field == 'mobile') {
                $db = $db->where('debt_assignment.to_uid', $uid);
            }
        }
        $datas['list'] = $db->groupBy('lender_invest.debt_no')
            ->orderBy('lender_invest.id', 'desc')
            ->skip(($page-1)*$pageSize)
            ->take($pageSize)
            ->get();
        $num = 0;
        foreach($datas['list'] as $k=>$value){
            //rowKey
            $num++;
            $datas['list'][$k]['index_id'] = $num;
            //title & serial_no & loan_term
            if ($value['ppid'] == 0) {
                $datas['list'][$k]['title'] = $this->project->productTitle($value['pid']);
                $info = $this->project->zhaiZhuanXinXi($value['pid']);
                $datas['list'][$k]['loan_term'] = $info->loan_term;
                $datas['list'][$k]['serial_num'] = $info->serial_no;
            } elseif ($value['ppid'] != 0) {
                $datas['list'][$k]['title'] = $this->project->productTitle($value['ppid']);
                $info = $this->project->zhaiZhuanXinXi($value['ppid']);
                $datas['list'][$k]['loan_term'] = $info->loan_term;
                $datas['list'][$k]['serial_num'] = $info->serial_no;
            }
            //mobile & name 
            if(!empty($value['from_uid'])){
                $data = $this->users->getUserDataById($value['from_uid']);
                $udata = $this->fyaccount->getFyDataById($value['from_uid']);
                $datas['list'][$k]['from_mobile'] = $data['mobile'];
                $datas['list'][$k]['from_name'] = $udata['full_name'];
            }
            //单个标的多次债转时 , to_name字段 取最新持有人的名字
            if(!empty($value['debt_no'])){
                $info = DebtAssignment::select('from_uid','to_uid')
                    ->where('debt_no',$value['debt_no'])
                    ->orderBy('id', 'desc')
                    ->first();
                $data = $this->users->getUserDataById($info->to_uid);
                $udata = $this->fyaccount->getFyDataById($info->to_uid);
                $datas['list'][$k]['to_mobile'] = $data['mobile'];
                $datas['list'][$k]['to_name'] = $udata['full_name'];
            }
        }
        $total = count($datas['list']);
        $datas['page'] = ["total" => $total, "current" => (int)$page, "pageSize" => (int)$pageSize];
        return $datas;
    }

    /*
     * 单条债权转让的历史记录
     * by mengxiang
     */
    public function  getDebtRecord($page, $pageSize,$debt_no)
    {
        $datas['list'] = DebtAssignment::select('from_user.mobile as from_mobile','debt_assignment.created_at as out_time','fact_all_amount','to_user.mobile as to_mobile','debt_assignment.updated_at as into_time','debt_assignment.from_uid','debt_assignment.to_uid')
            ->leftJoin('users as from_user', 'from_user.id', 'debt_assignment.from_uid')
            ->leftJoin('users as to_user', 'to_user.id', 'debt_assignment.to_uid')
            ->where('debt_assignment.debt_no',$debt_no)
            ->orderBy('debt_assignment.created_at', 'desc')
            ->get();
        $num = 0;
        foreach($datas['list'] as $k=>$value){
            //rowKey
            $num++;
            $datas['list'][$k]['index_id'] = $num;
            //name
            $from_udata = $this->fyaccount->getFyDataById($value['from_uid']);
            $datas['list'][$k]['from_uname'] = $from_udata['full_name'];
            $to_udata = $this->fyaccount->getFyDataById($value['to_uid']);
            $datas['list'][$k]['to_uname'] = $to_udata['full_name'];
        }
        $total = count($datas['list']);
        //已经债转没有人接收的情况下,历史记录显示为 "/"
        if($total == 1){#只有一条
            if($datas['list'][0]['from_uid'] == $datas['list'][0]['to_uid']){
                $keys=array("index_id","from_uname","from_mobile","out_time","fact_all_amount","to_uname","to_mobile","into_time");
                $datas['list'][0]=array_fill_keys($keys,"/");
            }
        }else if($total > 1){#多条
            foreach($datas['list'] as $k=>$value){
                if($datas['list'][$k]['from_uid'] == $datas['list'][$k]['to_uid']){
                    $datas['list'][$k]['to_uname'] = "/";
                    $datas['list'][$k]['to_mobile'] = "/";
                    $datas['list'][$k]['into_time'] = "/";
                    $datas['list'][$k]['fact_all_amount'] = "/";
                }
            }
        }
        $datas['page'] = ["total" => $total, "current" => $page, "pageSize" => $pageSize];
        return $datas;
    }
}
