<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class RiskQuestion extends Model
{
    //获取风险测评的题目
    public function getQuestion()
    {
        $data = DB::table('risk_question')
            ->select('questions', 'options')
            ->get()
            ->toArray();

        return $data;
    }
}
