<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class WorkingAbnormal extends Model
{

    const TAB_BORROWER_REPAY = 1;

    protected $table = 'working_abnormal';

    /**
     * 自动还款失败，划拨预冻结失败，保存用户列表
     */
    public function autoRepayTransferAndFreezeFail($workingId, $describe)
    {
        $this->table_name = self::TAB_BORROWER_REPAY;
        $this->working_id = $workingId;
        $this->describe = $describe;
        return $this->save();
    }

    /**
     * 提前还款失败，划拨预冻结失败，用户用户列表
     */
    public function earlyRepayTransferAndFreezeFail($pid, $period, $describe)
    {
        // 获取borrower_repay.id
        $borrowerRepay = new BorrowerRepay();
        $repayId = $borrowerRepay->getIdByPidAndPeriod($pid, $period);
        // 保存数据
        $this->table_name = self::TAB_BORROWER_REPAY;
        $this->working_id = $repayId;
        $this->describe = $describe;
        return $this->save();
    }
}