<?php

namespace App\Model;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class AutoRepayLog extends Model
{

    protected $table = 'auto_repay_log';

    /**
     * 还款成功新增数据
     */
    public function addSuccessData($brId, $fyFrId)
    {
        return DB::table($this->table)->insertGetId([
            'br_id'     => $brId,
            'fy_fr_id'  => $fyFrId,
            'status'    => 1,
            'exec_time' => time()
        ]);
    }

    /**
     * 还款失败新增数据
     */
    public function addFailData($brId, $remark)
    {
        return DB::table($this->table)->insertGetId([
            'br_id'     => $brId,
            'status'    => 2,
            'remark'    => $remark,
            'exec_time' => time()
        ]);
    }
}