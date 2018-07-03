<?php

namespace App\Model;
use DB;
use Illuminate\Database\Eloquent\Model;

class LoanApplyProject extends Model
{

    protected $table = 'loan_apply_project';

    /**
     * 通过产品ID获取借款申请ID
     */
    public function getAidByPid($pid)
    {
        $aid = 0;
        if($pid && $data = self::where(['pid' => $pid])->select('aid')->first()) {
            $aid = $data->aid;
        }
        return $aid;
    }

    /**
     * 通过apply_id 查找出 project_id
     */
    public function project_ids($apply_id)
    {
        foreach ($apply_id as $key => $val)
        {
            $project_id = DB::table($this->table)->where('aid','=',$val['id'])->select('pid')->first();
            $project[] = $project_id->pid;
        }
        return $project;
    }
}