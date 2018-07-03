<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Authentic extends Model
{

    protected $table = 'authentic';
    protected $primaryKey = 'uid';

    /**
     * 获取借款人身份证信息
     */
    public function getAuthentic($uid)
    {
        $data = self::where(['uid'=>$uid])->first();
        if($data) {
            return $data->original;
        }
        return NULL;
    }

    /**
     * 新增借款人身份证信息数据
     */
    public function insertAuthentic($data)
    {
        $this->uid = $data['uid'];
        $this->full_name = $data['full_name'];
        $this->id_card = $data['id_card'];
        $this->birth = $data['birth'];
        $this->sex = $data['sex'];
        $this->address = $data['address'];
        $this->nation = $data['nation'];
        $this->valid_begin = $data['valid_begin'];
        $this->valid_end = $data['valid_end'];
        $this->department = $data['department'];
        $this->identity_status = 2;
        return $this->save();
    }

    /**
     * 保存人脸识别数据
     */
    public function saveAuthentic($data)
    {
        $authenticData = self::where(['uid'=>$data['uid']])->first();
        if($data['matching'] < 1) {
            $data['matching'] *= 100;
        }
        $data['matching'] = intval($data['matching']);
        if($authenticData) {
            $authenticData->matching = $data['matching'];
            $authenticData->matching_status = $data['matching_status'];
            return $authenticData->save();
        }else {
            $this->uid = $data['uid'];
            $this->matching = $data['matching'];
            $this->matching_status = $data['matching_status'];
            return $this->save();
        }
    }

    //获取身份证信息
    public function idCardInfo($uid)
    {
        return DB::table('authentic')
            ->where('uid', $uid)
            ->first();
    }

    //获取name和身份证信息
    public function getNameIdcard($uid)
    {
        return DB::table('authentic')
            ->select('full_name', 'id_card')
            ->where('uid', $uid)
            ->first();
    }

    /**
     * 通过身份证查询
     */
    public function getAuthenticDataByIdCard($id_card)
    {
        $authenticData = [];
        if($id_card && $authenticData = self::where(['id_card'=>$id_card])->first()) {
            $authenticData = $authenticData->original;
        }

        return $authenticData;
    }

    /**
     * 获取借款人的姓名和性别 拼接（王先生 王女士）
     */
    public function getSurname($uid)
    {
        $data = DB::table($this->table)->where('uid',$uid)->select('full_name','sex')->first();
        if($data->sex == 1){
            $full_name = mb_substr($data->full_name,0,1,'utf-8').'先生';
        }elseif ($data->sex == 2){
            $full_name = mb_substr($data->full_name,0,1,'utf-8').'女士';
        }
        return $full_name;
    }
}
