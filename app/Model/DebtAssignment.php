<?php

namespace App\Model;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Log;

class DebtAssignment extends Model
{
    protected $table = 'debt_assignment';

    public function getDebtRecord($debt_no)
    {
        $sql = 'select left_terms, debt_money, status, UNIX_TIMESTAMP(updated_at) as date from debt_assignment where debt_no = ?
                and from_uid<>to_uid';

        return DB::select($sql, [$debt_no]);
    }

    //有人购买债转时修改债转记录表
    public function updateBuyDebtRecord($loan_num, $debt_no, $uid, $left_terms, $lender_amount, $lender_profit_after_dbet, $lock_money)
    {
        $sql = 'update debt_assignment set 
                to_uid = ?, status = 2, left_terms = ?, fact_all_amount = (?+?-?) 
                where from_lender_invest_num = ? and 
                debt_no = ?';

        return DB::update($sql, [$uid, $left_terms, $lender_amount, $lender_profit_after_dbet, $lock_money, $loan_num, $debt_no]);
    }
}
