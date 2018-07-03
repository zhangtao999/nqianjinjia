<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class LenderFundRecord extends Model
{
    protected $table = 'lender_fund_record';

    //资金明细(按状态)
    public function ziJinList($uid, $status, $p, $c)
    {
        $data = DB::table('lender_fund_record')
            ->selectRaw('deal, entry, amt, date_format(created_at, "%Y%m") as created_at, unix_timestamp(created_at) as timestamp')
            ->whereRaw("uid = $uid and deal in ($status)")
            ->orderBy('id', 'desc')
            ->offset(($p - 1) * $c)
            ->limit($c)
            ->get()
            ->toArray();

        return $data;
    }

    //所有记录
    public function ziJinListAll($uid, $p, $c)
    {
        $data = DB::table('lender_fund_record')
            ->selectRaw('deal, entry, amt, date_format(created_at, "%Y%m") as created_at, unix_timestamp(created_at) as timestamp')
            ->where('uid', $uid)
            ->orderBy('id', 'desc')
            ->offset(($p - 1) * $c)
            ->limit($c)
            ->get()
            ->toArray();

        return $data;
    }

    /**
     * 出借人投资新增资金记录
     */
    public function investAddData($uid, $amt, $pid)
    {
        $this->uid   = $uid;
        $this->amt   = $amt;
        $this->deal  = 8;
        $this->entry = 2;
        $this->pid   = $pid;
        return $this->save();
    }

    //新增充值资金记录
    public function addChongzhiJilu($money, $uid)
    {
        $this->uid     = $uid;
        $this->amt     = $money;
        $this->deal    = 1;
        $this->entry   = 1;
        $this->remarks = '充值';
        return $this->save();
    }

    //新增充值资金记录
    public function addReward($uid, $amt, $remark = "平台奖励")
    {
        $this->uid     = $uid;
        $this->amt     = $amt;
        $this->deal    = 7;
        $this->entry   = 1;
        $this->remarks = $remark;
        return $this->save();
    }

    //新增提现资金记录
    public function addTixianJilu($money, $uid)
    {
        $this->uid     = $uid;
        $this->amt     = $money;
        $this->deal    = 2;
        $this->entry   = 2;
        $this->remarks = '提现';
        return $this->save();
    }

    //账户消息
    public function zhanghuXiaoxi($uid, $p, $c)
    {
        return DB::table('lender_fund_record')
            ->leftJoin('project', 'project.id', 'lender_fund_record.pid')
            ->leftJoin('lender_payment', 'lender_payment.id', 'lender_fund_record.pay_id')
            ->selectRaw('lender_payment.amt as benjin, lender_payment.profit as lixi, project.title, lender_fund_record.deal, lender_fund_record.amt, lender_fund_record.remarks, lender_fund_record.entry, date_format(lender_fund_record.created_at, "%Y %m-%d") as created_at, date_format(lender_fund_record.created_at, "%H:%i") as time, date_format(lender_fund_record.created_at, "%Y-%m-%d") as msg_time')
            ->where('lender_fund_record.uid', $uid)
            ->orderBy('lender_fund_record.created_at', 'desc')
            ->offset(($p - 1) * $c)
            ->limit($c)
            ->get()
            ->toArray();
    }

    public function lastInfo($uid)
    {
        return DB::table('lender_fund_record')
            ->leftJoin('project', 'project.id', 'lender_fund_record.pid')
            ->leftJoin('lender_payment', 'lender_payment.id', 'lender_fund_record.pay_id')
            ->select('lender_fund_record.created_at')
            ->where('lender_fund_record.uid', $uid)
            ->orderBy('lender_fund_record.id', 'desc')
            ->first();
    }

    /**
     * 新增提现失败退款记录
     */
    public function addWithdrawFailData($uid, $amt)
    {
        $this->uid  = $uid;
        $this->amt  = $amt;
        $this->deal = 6;
        $this->entry = 1;
        return $this->save();
    }

    /**
     * 新增流标回款的记录
     */
    public function addProjectLessRecord($uid, $amt, $pid)
    {
        $this->uid  = $uid;
        $this->amt  = $amt;
        $this->deal = 5;
        $this->entry = 1;
        $this->pid = $pid;
        return $this->save();
    }

    public function addTransferRecord($uid, $lender_amount, $deal, $entry)
    {
        $sql = 'insert into lender_fund_record 
                (uid, amt, deal, entry) value (?, ?, ?, ?)';

        return DB::insert($sql, [$uid, $lender_amount, $deal, $entry]);
    }
}
