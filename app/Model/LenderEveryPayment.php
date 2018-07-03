<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class LenderEveryPayment extends Model
{

    const LENDER_EVERY_PAYMENT_DATA_ALREADY = '出借人每期还款数据已存在';

    protected $table = 'lender_every_payment';

    /**
     * 批量插入每期回款数据
     */
    public function batchAddLenderEveryPaymentData($batchData, $payId)
    {
        if($batchData) {
            if(!self::where(['pay_id'=>$payId])->first()) {
                if(DB::table($this->table)->insert($batchData)) {
                    return true;
                }
            }else {
                return self::LENDER_EVERY_PAYMENT_DATA_ALREADY;
            }
        }
        return false;
    }

    /**
     * 获取某一期的出借人回款数据
     */
    public function getOnePeriodData($pid, $period)
    {
        $data = [];
        if($pid && $period && ($result = self::where(['pid'=>$pid, 'period'=>$period, 'status'=>1])->get())) {
            foreach ($result as $val) {
                $data[] = $val->original;
            }
        }

        return $data;
    }

    /**
     * 设置某一期的回款数据为划拨预冻结
     */
    public function setFreeze($pid, $period)
    {
        return self::where(['pid'=>$pid, 'period'=>$period, 'status'=>1])->update(['status'=>2, 'freeze_time'=>time()]);
    }

    /**
     * 获取某个标的剩余未还的所有回款数据
     */
    public function getSurplusDataOfPid($pid)
    {
        $data = [];
        if($pid && ($result = self::where(['pid'=>$pid, 'status'=>1])->get())) {
            foreach ($result as $val) {
                $data[] = $val->original;
            }
        }

        return $data;
    }

    /**
     * 设置某个标的剩余未还的回款数据为划拨预冻结
     */
    public function setFreezeOfPid($pid)
    {
        return self::where(['pid'=>$pid, 'status'=>1])->update(['status'=>2, 'freeze_time'=>time()]);
    }

    /**
     * 查询产品某一期的出借利息
     */
    public function getProjectProfitOfPeriod($pid, $period)
    {
        return self::where(['pid'=>$pid, 'period'=>$period])->sum('profit');
    }
}