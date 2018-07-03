<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use DB;

class LoanApply extends Model
{

    protected $table;
    protected $where;

    public function __construct()
    {

        $this->table = 'loan_apply';
    }

    /**
     * 添加借款记录
     */
    public function apply_insert($data)
    {
        $data = DB::table($this->table)->insertGetId($data);
        return $data;
    }

    /**
     * 用户借款记录
     */
    public function loan_record($uid,$p,$c)
    {
        $where['uid'] = $uid;
        $data = DB::table('loan_apply')
            ->leftJoin('loan', 'loan_apply.loan_id', '=', 'loan.id')
            ->select('loan_apply.*','loan.title')
            ->where($where)
            ->orderBy('created_at','DESC')
            ->offset(($p-1)*$c)
            ->limit($c)
            ->get();
        $data = json_decode(json_encode($data), true);
        return $data;
    }

    /**
     * 获取用户申请id
     */
    public function apply_ids($uid)
    {
        $where['uid'] = $uid;
        $data = DB::table('loan_apply')
            ->select('id')
            ->where($where)
            ->get();
        $data = json_decode(json_encode($data), true);
        return $data;
    }

    /**
     * 借款进度
     */
    public function loan_speed($apply_id)
    {
        $where['loan_apply.id'] = $apply_id;
        return DB::table('loan_apply')
            ->leftJoin('loan', 'loan_apply.loan_id', '=', 'loan.id')
            ->select('loan_apply.*','loan.title')
            ->where($where)
            ->first();
    }

    /**
     * 获取借款申请数据
     */
    public function getDataById($id)
    {
        $data = [];
        if($id && ($data = self::where(['id'=>$id])->first())) {
            $data = $data->original;
        }
        return $data;
    }

    /**
     * 通过申请id获取uid
     */
    public function getUid($apply_id)
    {
        $data =  DB::table($this->table)->where('id','=',$apply_id)->select('uid','quota','purpose','rate')->first();
        if($data){
            $list = [
                'quota' => $data->quota,
                'uid'   => $data->uid,
                'purpose' => $data->purpose,
                'rate' => $data->rate
            ];
        }
        return $list;
    }

    /**
     * 获取最近一条的申请id
     */
    public function repayDescId($uid)
    {
       $data = DB::table($this->table)->where('uid','=',$uid)->orderBy('created_at','DESC')->first();
       if($data){
           $apply_id = $data->id;
           return $apply_id;
       }
    }

    /**
     * 获取用户是否有正在进行中的借款申请
     */
    public function justApply($uid)
    {
       $sql = "select * from loan_apply WHERE uid = $uid and status in(1,2,4,5,6)";
       $data = DB::select($sql);
       if(!empty($data)){
           $apply_id = $data['0']->id;
           return $apply_id;
       }
    }

    /**
     * 产品流标，设置借款申请为失败
     */
    public function setLoanApplyFail($aid)
    {
        if($aid && ($loanApplyData = self::where(['id'=>$aid])->first())) {
            $loanApplyData->status = 7;
            $loanApplyData->flow_time = time();
            return $loanApplyData->save();
        }

        return false;
    }

    /**
     * 更新放款提现的流水号字段
     */
    public function setSerialNum($id, $serialNum)
    {
        if($id && ($loanApplyData = self::where(['id'=>$id])->first())) {
            $loanApplyData->serial_num = $serialNum;
            return $loanApplyData->save();
        }

        return false;
    }

    /**
     * 放款到账成功设置时间和状态
     */
    public function loanSuccess($serialNum)
    {
        if($serialNum && ($loanApplyData = self::where(['serial_num'=>$serialNum])->first())) {
            $loanApplyData->status = 6;
            $loanApplyData->end_time = time();
            return $loanApplyData->save();
        }

        return false;
    }

    /**
     * 放款到账失败设置时间和状态
     */
    public function loanFail($serialNum)
    {
        if($serialNum && ($loanApplyData = self::where(['serial_num'=>$serialNum])->first())) {
            $loanApplyData->status = 9;
            return $loanApplyData->save();
        }

        return false;
    }

    /**
     * 设置借款申请已完成
     */
    public function setLoanApplyFinish($id)
    {
        if($id && ($loanApplyData = self::where(['id'=>$id])->first())) {
            $loanApplyData->status = 8;
            return $loanApplyData->save();
        }

        return true;
    }

    /*
     * 截取市
     */
    public function cut_str($str,$sign,$number){
        $array=explode($sign, $str);
        $length=count($array);
        if($number<0){
            $new_array=array_reverse($array);
            $abs_number=abs($number);
            if($abs_number>$length){
                return 'error';
            }else{
                return $new_array[$abs_number-1];
            }
        }else{
            if($number>=$length){
                return 'error';
            }else{
                return $array[$number];
            }
        }
    }

    /**
     * 查询用户是否有正在进行中的借款
     */
    public function getUserDoLoanApply($uid)
    {
        return self::where(['uid'=>$uid])->whereIn('status', [1,2,4,5])->first();
    }

}
