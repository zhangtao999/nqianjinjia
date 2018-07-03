<?php

namespace App\Model;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Borrower extends Model
{

    /**
     * 借款人信息表
     */
    protected $table;
    protected $primaryKey;
    protected $where;

    public function __construct()
    {
        $this->table      = 'borrower';
        $this->primaryKey = 'uid';
    }

    /**
     * 保存借款人信息
     */
    public function borrow_add($list)
    {
        return DB::table($this->table)->insert($list);

    }

    /**
     * 判断用户是否验证个人信息
     */
    public function borrow_query($uid)
    {
        $where['uid'] = $uid;
        return DB::table('borrower')
            ->leftJoin('users', 'borrower.uid', '=', 'users.id')
            ->select('borrower.*', 'users.mobile')
            ->where($where)
            ->first();
    }

    /**
     * 修改借款人个人信息
     */
    public function borrow_update($data, $uid)
    {
        $where['uid'] = $uid;
        return DB::table($this->table)->where($where)->update($data);
    }

    /**
     * 借款人额度
     */
    public function borrow_quoda($uid)
    {
        $where['uid'] = $uid;
        return DB::table($this->table)->select('loan_money', 'quota', 'no_repay_money')->where($where)->first();
    }

    /**
     * 保存借款人小蜜分和灰度分
     */
    public function saveQuotaScore($uid, $bee_score, $phone_gray_score, $quota)
    {
        $borrowerData = self::where(['uid' => $uid])->first();
        if ($borrowerData) {
            $borrowerData->bee_score         = $bee_score;
            $borrowerData->phone_gray_score  = $phone_gray_score;
            $borrowerData->quota             = $quota;
            $borrowerData->test_quota_time = time();
            return $borrowerData->save();
        } else {
            $this->uid               = $uid;
            $this->bee_score         = $bee_score;
            $this->phone_gray_score  = $phone_gray_score;
            $this->quota             = $quota;
            $this->test_quota_time = time();
            return $this->save();
        }
    }

    //添加一条借款人数据
    public function addBorrower($id)
    {
        $this->uid = $id;
        $this->save();
    }

    /**
     * 获取借款人信息
     */
    public function getBorrowerData($uid)
    {
        $borrowerData = [];
        if ($uid && ($result = self::where(['uid' => $uid])->first())) {
            $borrowerData = $result->original;
        }
        return $borrowerData;
    }

    //修改通讯信息验证状态
    public function updateContactStatus($uid)
    {
        return DB::table('borrower')
            ->where('uid', $uid)
            ->update(['communi_status' => 1]);
    }

    /**
     * 获取借款人所在地区
     */
    public function region($uid)
    {
        return DB::table($this->table)->where('uid',$uid)->select('live_address')->first();
    }

    /**
     * 更新借款人的待还金额
     */
    public function updateNoRepayMoney($uid, $amt)
    {
        if($amt == 0) {
            return self::where(['uid'=>$uid])->update(['no_repay_money'=>0]);
        }else {
            return self::where(['uid'=>$uid])->decrement('no_repay_money', $amt);
        }
    }
}