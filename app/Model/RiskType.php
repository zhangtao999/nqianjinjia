<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class RiskType extends Model
{
    //获取风险等级
    public function riskType($score)
    {
        $type = DB::table('risk_type')
            ->select('name', 'desc', 'id')
            ->where('high_score', '>=', $score)
            ->where('low_score', '<=', $score)
            ->first();

        return $type;
    }
}
