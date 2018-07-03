<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class BorrowerFundRecord extends Model
{

    protected $table = 'borrower_fund_record';

    /**
     * 查询用户借总借款金额
     */
    public function loanMoney($uid){
        $money = DB::table($this->table)->where('uid','=',$uid)->where('deal','=','1')->where('entry','=','1')->select('amt')->get();
        $money = json_decode(json_encode($money), true);
        $loan_moneys = '0';
        foreach ($money as $key => $val){
            $loan_moneys += $val['amt'];
        }
        return $loan_moneys;
    }

    /**
     * 新增借款人自动还款时，银行卡代扣记录
     */
    public function addBankWithholdData($uid, $amt)
    {
        $this->uid = $uid;
        $this->amt = $amt;
        $this->deal = 4;
        $this->entry = 1;
        return $this->save();
    }
}
