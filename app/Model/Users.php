<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use DB;

class Users extends Model
{

    protected $table;

    protected $where;

    public function __construct()
    {
        $this->table = 'users';
    }

    public function userinfo($where)
    {
        return DB::table($this->table)->where($where)->first();
    }

    public function user_update($where,$data)
    {
        return DB::table($this->table)->where($where)->update($data);
    }

    public function getUserDataById($id)
    {
        $userData = [];
        if($id && ($userData = self::where(['id'=>$id])->first())) {
            $userData = $userData->original;
        }
        return $userData;
    }

    //获取支付密码
    public function getPayPwdMobile($uid)
    {
        return DB::table('users')
            ->where('id', $uid)
            ->value('pay_password');
    }

    //获取手机号
    public function getMobile($uid)
    {
        return DB::table('users')
            ->where('id', $uid)
            ->value('mobile');
    }

    //修改支付密码
    public function updatePayPWD($uid, $pwd_new)
    {
        DB::table('users')
            ->where('id', $uid)
            ->update(['pay_password' => md5($pwd_new)]);
    }

    //邀请列表
    public function yaoqingList($uid, $p, $c)
    {
        return DB::table('users')
            ->selectRaw('mobile, date_format(created_at, "%Y-%m-%d") as created_at, id')
            ->where('from_uid', $uid)
            ->offset(($p-1)*$c)
            ->limit($c)
            ->get()
            ->toArray();
    }

    //通过mobile获取uid
    public function getUid($mobile)
    {
        return DB::table('users')
            ->where('mobile', $mobile)
            ->value('id');
    }

    //是否设置过支付密码
    public function issetPayPwd($uid)
    {
        return DB::table('users')
            ->where('id', $uid)
            ->value('pay_password');

    }

    /**
     * 活动页面注册入库
     */
    public function usersInsert($data)
    {
       $user_id = DB::table($this->table)->insertGetId($data);
       return $user_id;
    }
}
