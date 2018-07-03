<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class FyBank extends Model
{
    /**
     * 后台管理用户表
     *
     * @var string
     */
    protected $table;

    public function __construct()
    {
        $this->table = 'fy_bank';
    }

    /**
     * 获取银行信息
     */
    public function getBank()
    {
       return DB::table($this->table)->get();
    }

    //绑卡信息
    public function infoCard($uid)
    {
        $data = DB::table('fy_account')
            ->join('fy_bank', 'fy_bank.code', 'fy_account.bank_code')
            ->selectRaw('fy_bank.name, right(fy_account.bank_card, 4) as bank_card, fy_bank.entrust_once_money, fy_bank.entrust_day_money, fy_bank.entrust_day_num, fy_bank.entrust_month_money, fy_bank.quick_once_money, fy_bank.quick_day_money, fy_bank.quick_day_num, fy_bank.quick_month_money')
            ->where('fy_account.uid', $uid)
            ->first();

        return $data;
    }
}
