<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class FyFundRecord extends Model
{

    const WITHDRAW_FEE = 200;

    protected $table = 'fy_fund_record';

    /**
     * 投资新增资金记录
     */
    public function investAddData($uid, $amt, $to_uid)
    {
        $this->uid    = $uid;
        $this->amt    = $amt;
        $this->deal   = 8;
        $this->status = 2;
        $this->to_uid = $to_uid;
        return $this->save();
    }

    //添加充值记录
    public function addChongzhiJilu($money, $uid, $order_id)
    {
        $this->uid        = $uid;
        $this->serial_num = $order_id;
        $this->amt        = $money;
        $this->deal       = 1;
        $this->status     = 2;
        return $this->save();
    }

    //添加提现记录
    public function addTixianJilu($money, $uid, $order_id)
    {
        $this->uid        = $uid;
        $this->serial_num = $order_id;
        $this->amt        = $money;
        $this->deal       = 2;
        $this->status     = 1;
        return $this->save();
    }

    // 添加放款提现记录
    public function addLoanWithdrawRecord($money, $uid, $order_id)
    {
        $this->uid        = $uid;
        $this->serial_num = $order_id;
        $this->amt        = $money;
        $this->deal       = 5;
        $this->status     = 1;
        return $this->save();
    }

    /**
     * 增加划拨记录
     */
    public function addTransfer($uid, $amt, $toUid)
    {
        return DB::table($this->table)->insertGetId([
            'uid'   => $uid,
            'amt'   => $amt,
            'deal'  => 3,
            'status'=> 2,
            'to_uid'=> $toUid,
        ]);
    }

    //提现明细
    public function tixianChongzhiJilu($uid, $type)
    {
        return DB::table('fy_fund_record')
            ->select('status', 'created_at', 'amt')
            ->where('uid', $uid)
            ->where('deal', $type)
            ->orderBy('created_at', 'desc')
            ->get()
            ->toArray();
    }

    //提现中的记录
    public function tiXianZhong($uid)
    {
        return DB::table('fy_fund_record')
            ->selectRaw('sum(amt) as yue_tixian')
            ->where('uid', $uid)
            ->where('deal', 2)
            ->where('status', 1)
            ->first();
    }

    /**
     * 设置提现状态为已成功
     */
    public function setWithdrawStatusSuccess($mchnt_txn_ssn)
    {
        $fundRecordData = self::where(['serial_num'=>$mchnt_txn_ssn])->first();
        if($fundRecordData) {
            $fundRecordData->status = 2;
            return $fundRecordData->save();
        }

        return false;
    }

    /**
     * 新增提现手续费
     */
    public function addWithdrawFee($mchnt_txn_ssn)
    {
        $fundRecordData = self::where(['serial_num'=>$mchnt_txn_ssn])->first();
        if($fundRecordData) {
            $this->uid = $fundRecordData->uid;
            $this->serial_num = $mchnt_txn_ssn;
            $this->amt = self::WITHDRAW_FEE;
            $this->deal = 4;
            $this->status = 2;
            return $this->save();
        }

        return false;
    }

    /**
     * 设置提现状态为失败
     */
    public function setWithdrawStatusFail($mchnt_txn_ssn)
    {
        $fundRecordData = self::where(['serial_num'=>$mchnt_txn_ssn])->first();
        if($fundRecordData) {
            $uid = $fundRecordData->uid;
            $fundRecordData->status = 3;
            $fundRecordData->save();
            return $uid;
        }

        return false;
    }

    /**
     * 增加流标的资金记录
     */
    public function addProjectLessRecord($uid, $amt, $to_uid)
    {
        $this->uid = $uid;
        $this->amt = $amt;
        $this->deal = 6;
        $this->status = 2;
        $this->to_uid = $to_uid;
        return $this->save();
    }

    /**
     * 增加红包奖励记录
     */
    public function addRedpacketRecord($uid, $amt, $to_uid,$status)
    {
        $this->uid = $uid;
        $this->amt = $amt;
        $this->deal = 7;
        $this->status = $status;
        $this->to_uid = $to_uid;
        return $this->save();
    }
    /**
     * 查询红包记录
     */
    public function findRedpacketRecord($to_uid, $cpage,$pSize)
    {
        $dbTmp=DB::table($this->table)->select('*');
        $where=['deal' => 7]; //红包为7
        if ($to_uid){
            $where['to_uid']=$to_uid;
        }

        //TODO ->orderBy('created_at', 'desc')
        return $dbTmp->where($where)->offset(($cpage-1)*$pSize)->limit($pSize)->get()->toArray();

    }

    //添加一条富友资金记录
    public function addFundRecord($uid, $lender_amount, $deal, $status, $to_uid, $pay_for_serial_num)
    {
        $sql = 'insert into fy_fund_record 
                (uid, amt, deal, status, to_uid, pay_for_serial_num) value (?, ?, ?, ?, ?, ?)';

        return DB::insert($sql, [$uid, $lender_amount, $deal, $status, $to_uid, $pay_for_serial_num]);
    }
}
