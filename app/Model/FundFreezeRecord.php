<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class FundFreezeRecord extends Model
{

    const TAB_LENDER_INVEST = 1;
    const TAB_BORROWER_REPAY = 2;
    const STATUS_FREEZE = 1;
    const STATUS_UNFREEZE = 2;
    const STATUS_OMNER_FREEZE = 3;

    protected $table = 'fund_freeze_record';

    /**
     * 购买产品增加记录
     */
    public function addLenderInvestData($serialNum, $pid, $amt, $fromUid, $toUid)
    {
        $this->serial_num = $serialNum;
        $this->pid = $pid;
        $this->table_name = self::TAB_LENDER_INVEST;
        $this->amt = $amt;
        $this->from_uid = $fromUid;
        $this->to_uid = $toUid;
        $this->status = self::STATUS_FREEZE;
        return $this->save();
    }

    /**
     * 获取出借人投资的冻结数据
     */
    public function getLenderInvestFreezeData($pid, $toUid)
    {
        $data = [];
        $allAmt = 0;
        if($pid && ($result = self::where(['pid'=>$pid, 'to_uid'=>$toUid, 'table_name'=>self::TAB_LENDER_INVEST, 'status'=>self::STATUS_FREEZE])->get())) {
            foreach ($result as $val) {
                $data[] = $val->original;
                $allAmt += $val->amt;
            }
        }

        return [$data, $allAmt];
    }

    /**
     * 解冻出借人投资的冻结数据
     */
    public function unFreezeLenderInvestFreezeData($pid, $toUid)
    {
        return self::where(['pid'=>$pid, 'to_uid'=>$toUid, 'table_name'=>self::TAB_LENDER_INVEST, 'status'=>self::STATUS_FREEZE])->update(['status'=>self::STATUS_UNFREEZE]);
    }

    /**
     * 借款人还款时批量插入数据
     */
    public function borrowerRepayBatchAddFreezeData($batchAddData)
    {
        return DB::table($this->table)->insert($batchAddData);
    }
}