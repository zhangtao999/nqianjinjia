<?php

namespace App\Model;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class UserAccountSafe extends Model
{
    /**
     * 锁定用户表
     */
    protected $table = 'user_account_safe';

    public function userAccountInfo($uid)
    {
       $data = DB::table($this->table)->where('uid','=',$uid)
           ->first();
        $data = json_decode(json_encode($data), true);
        return $data;
    }

    public function userSafeInsert($userSafe)
    {
        return DB::table($this->table)->insert($userSafe);
    }

    public function userSafeUpdate($update_info,$uid)
    {
       return DB::table($this->table)->where('uid','=',$uid)->update($update_info);
    }

    public function insert($uid)
    {
        $data = ['uid' => $uid];
        return DB::table($this->table)->insert($data);

    }
}
