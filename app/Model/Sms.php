<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use DB;

class Sms extends Model
{

    protected $table;
    protected $where;

    public function __construct()
    {

        $this->table = 'sms';
    }

    /**
     * 添加手机验证码
     */
    public function sms_insert($data)
    {
        return DB::table($this->table)->insert($data);
    }

    /**
     * 获取验证码
     */
    public function sms_info($where){
        $data = DB::table($this->table)->where($where)->orderBy('id', 'desc')->first();
        return $data;
    }

    /**
     * 删除短信
     */
    public function  sms_delete($scene,$mobile)
    {
        $where['scene'] = $scene;
        $where['mobile'] = $mobile;
        $data = DB::table($this->table)->where($where)->delete();
    }

    /**
     * 校验验证码
     */
    public function checkSms($mobile,$scene,$code)
    {
        if($scene == config("system.sms_scene.verify")){
           $sql = "select id,code from sms where date_add(created_at,INTERVAL ".config("system.sms_scene.effectiveTime")." MINUTE) >= NOW() and mobile='{$mobile}' and status=".config("system.sms_scene.sendSuccess")." and scene = '".config("system.sms_scene.verify")."' order by created_at desc limit 1";
           $data = DB::select($sql);
           return $data;
        }
        if($scene == config("system.sms_scene.forget") ){
            $sql = "select id,code from sms where date_add(created_at,INTERVAL ".config("system.sms_scene.effectiveTime")." MINUTE) >= NOW() and mobile='{$mobile}' and status=".config("system.sms_scene.sendSuccess")." and scene = '".config("system.sms_scene.forget")."' order by created_at desc limit 1";
            $data = DB::select($sql);
            return $data;
        }
    }

    /**
     * 修改验证码状态
     */
    public function smsStatusUpdate($data){
        return DB::table($this->table)->update($data);
    }


}
