<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class WithdrawCashReview extends Model
{
    /**
     * withdraw_cash_review 表
     *
     * @var string
     */
    protected $table;

    protected $id;
    protected $amount;         //提现金额
    protected $review_status;   //审核状态,默认1，待审核
    protected $review_person;   //审核人
    protected $updated_at;      //更新时间
    protected $service_money;  //服务费
    protected $service_rate;    //服务费率
    protected $remain_money;    //账户余额
    protected $to_account_money; //到账金额
    protected $refuse_reason; //到账金额
    protected $review_date; //到账金额

    public function __construct()
    {
        $this->table = 'withdraw_cash_review';
    }

    //添加提现申请记录
    public function addWithdrawCashRecord($uid, $money, $balance)
    {
        $sql = 'insert into withdraw_cash_review 
                (uid, amount, remain_money, review_status) 
                value (?, ?, ?, 1)';

        return DB::insert($sql, [$uid, $money, $balance, 1]);
    }

}
