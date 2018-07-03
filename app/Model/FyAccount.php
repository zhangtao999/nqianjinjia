<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use DB;

class FyAccount extends Model
{
    /**
     * 富友账户表
     *
     * @var string
     */
    protected $table      = 'fy_account';
    protected $primaryKey = 'uid';

    /**
     * 查询用户是否开户
     */
    public function ifUserAccount($uid)
    {
        if ($uid) {
            if (self::where(['uid' => $uid])->first()) {
                return true;
            }
        }
        return false;
    }

    /**
     * 新增富友账户数据
     */
    public function insert($data)
    {
        $this->uid       = $data['uid'];
        $this->full_name = $data['cust_nm'];
        $this->id_card   = $data['certif_id'];
        $this->mobile    = $data['mobile_no'];
        $this->area_code = $data['city_id'];
        $this->bank_code = $data['parent_bank_id'];
        $this->bank_card = $data['capAcntNo'];
        $this->sign_status = $data['sign_status'] ?? 0;
        return $this->save();
    }

    /**
     * 获取用户富友账户数据
     */
    public function getFyDataById($uid)
    {
        $fyData = [];
        if ($uid && ($fyData = self::where(['uid' => $uid])->first())) {
            $fyData = $fyData->original;
        }
        return $fyData;
    }

    /**
     * 获取用户的银行卡号和开户行
     */
    public function bank_content($uid)
    {
        $where['uid'] = $uid;
        return DB::table('fy_account')
            ->leftJoin('fy_bank', 'fy_account.bank_code', '=', 'fy_bank.code')
            ->select('fy_account.bank_card', 'fy_bank.name')
            ->where($where)
            ->first();

    }

    //通过uid获取手机号
    public function getMobileById($uid)
    {
        $mobile = DB::table('fy_account')
            ->where('uid', $uid)
            ->value('mobile');

        return $mobile;
    }

    //获取绑卡信息
    public function bangCardInfo($uid)
    {
        return DB::table('users')
            ->leftJoin('fy_account', 'fy_account.uid', 'users.id')
            ->leftJoin('authentic', 'authentic.uid', 'users.id')
            ->leftJoin('fy_bank', 'fy_bank.code', 'fy_account.bank_code')
            ->leftJoin('fy_bank_area', 'fy_bank_area.code', 'fy_account.area_code')
            ->select('fy_account.full_name as full_name_fy', 'fy_account.id_card as id_card_fy', 'fy_bank.name', 'fy_account.bank_card', 'authentic.full_name', 'fy_account.mobile', 'authentic.id_card', 'fy_bank_area.name as area_shi', 'fy_bank_area.code_id')
            ->where('users.id', $uid)
            ->first();
    }

    //是否绑卡
    public function isBindCard($uid)
    {
        return DB::table('fy_account')
            ->where('uid', $uid)
            ->value('uid');
    }

    /**
     * 保存天威合同用户编号
     */
    public function saveTwUserId($uid, $tw_user_id)
    {
        $fyAccountData = self::where(['uid' => $uid])->first();
        if ($fyAccountData) {
            $fyAccountData->tw_user_id = $tw_user_id;
            return $fyAccountData->save();
        }

        return false;
    }

    /**
     * 根据身份证查询富友账号数据，如果存在，则更新富有账户的uid
     */
    public function fyAccountDataMove($uid, $name, $idCard)
    {
        $fyAccountData = self::where(['id_card'=>$idCard,'full_name'=>$name])->first();
        if($fyAccountData) {
            $fyAccountData->uid = $uid;
            return $fyAccountData->save();
        }

        return NULL;
    }

    /**
     * 设置用户已签约
     */
    public function setBankSign($mobile)
    {
        return self::where(['mobile'=>$mobile])->update(['sign_status'=>1]);
    }

}
