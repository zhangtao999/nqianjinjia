<?php

namespace App\Service;
use App\Common\Yunpian;
use App\Model\Sms;
use App\Model\Users;
use Illuminate\Support\Facades\Log;

class SmsService
{

    /**
     * 短信模板
     */
    public $tpl = array(
        "recharge"     => "【钱进家】尊敬的用户#username#您于#time#成功充值#chongzhi#元，目前账户可用余额#blance#元",   //充值
        "putForward"   => "【钱进家】尊敬的用户#username#您的一笔#tixian#元的提现申请成功，资金将于1-2个工作日内汇入您的银行卡账户，请注意查收。", //提现
        "lend"         => "【钱进家】尊敬的用户#username#您已成功出借#chujie#元（#product#），您可以去“出借记录”中查看详情。",  //出借
        "returnMoney"  => "【钱进家】尊敬的用户#username#您投资的#blance#元已回款（#product#），本金#benjin#元，收益#shouyi#元，已汇入您的账户余额中，请注意查收。", //回款
        "stream"       => "【钱进家】尊敬的用户#username#您出借的#money#元已流标（#product#），本金#blance#元，已汇入您的账户余额中，请注意查收。", //流标
        "verify_one"   => "【钱进家】您的验证码为#code#，有效期#min#分钟，感谢您的关注和支持。",
        "register"     => "【钱进家】尊敬的客户，感谢您注册钱进家，您的账号是#mobile#，请牢记密码。",
        "loginpwd"     => "【钱进家】尊敬的#name#，您于#time#修改了登录密码，请牢记并妥善保管新密码。",
        "buypwd"       => "【钱进家】尊敬的#name#，您于#time#修改了支付密码，请牢记并妥善保管新密码。",
        "bincard"      => "【钱进家】尊敬的#name#，您于#time#绑卡成功。",
        "wrongfive"    => "【钱进家】尊敬的#name#，您的登录密码已连续5次输入错误，为保证账户安全，账户24小时以后才可以登录。",
        "wrongthree"   => "【钱进家】尊敬的#name#，您的支付密码已连续3次输入错误，您可尝试找回支付密码。",
        "submission"   => "【钱进家】尊敬的用户#username#，您的借款申请已提交请等待审核。",              //申请已提交
        "auditFailure" => "【钱进家】尊敬的用户#username#，您的借款申请审核失败，请登录app查看详情。",    //审核失败
        "auditSuccess" => "【钱进家】尊敬的用户#username#，您的借款申请审核成功，请登录app查看详情。",    //审核成功
        "centralization" => "【钱进家】尊敬的用户#username#，您的借款正在筹集中，请登录app查看详情。",   //凑集中
        "raiseSuccess"   => "【钱进家】尊敬的用户#username#，您的借款申请已筹集结束正在发放中预计1-2个工作日会到账请注意查收。", //筹集成功放款中
        "fundsAccount"   => "【钱进家】尊敬的用户#username#，您的借款已到账，祝您开心生活，感谢您对平台的支持。",     //已到账
        "loanDefeated"   => "【钱进家】尊敬的用户#username#，您的借款失败，您可以重新发起申请，感谢您对平台的支持。",     //借款失败
        "remindLoad"     => "【钱进家】尊敬的用户#username#，您的借款第#qishu#期即将到期，请确保绑定银行卡余额充足，以保证后续正常使用！如有疑虑,请详询4008116118", //提醒用户还款
        "repaySuccess"   => "【钱进家】尊敬的用户#username#，您的借款第#qishu#期还款成功，感谢您对平台的支持", //正常还款成功
        "repaySettle"    => "【钱进家】尊敬的用户#username#，您的借款已结清，感谢您对钱进家的支持。", //借款结清提醒
        "repayOverdue"   => "【钱进家】尊敬的用户#username#，您的借款第#qishu#期已到期，请确保绑定银行卡余额充足，以保证后续正常使用！", //逾期提醒
    );

    /**
     * 发送手机验证码
     */
    public function sendSms($mobile, $type)
    {
        $Yunpian = new Yunpian();
        $sms = new Sms();
        $users = new Users();
        //生成6位数字的验证码
        $code = mt_rand(100000, 999999);
        $min  = '20';
        //短信模版
        $tpl = "";
        if($type == 1)
        {
            $tpl = "【钱进家】您的验证码为".$code."，有效期".$min."分钟，感谢您的关注和支持。";
        }
        elseif($type == 2)
        {
            $where['mobile'] = $mobile;
            $user_info = $users->userinfo($where);
            if(empty($user_info)){
                return ['code' => '413', 'msg' => '请先注册'];
            }else{
               $tpl = "【钱进家】您的验证码为".$code."，有效期".$min."分钟，感谢您的关注和支持。";
            }
        }
        //发送
        $r = $Yunpian->signleSend($mobile, $tpl);
        Log::info(__FUNCTION__ . __LINE__ . ',start with draw pass,r=' , ['res'=>$r , 'text' => $tpl]);
        $data = [
              'mobile' => $mobile,
              'code' => $code,
              'scene' => $type,
              'message' => $tpl,
              'status' => $r['code'],
              'response' => json_encode($r),
        ];
        $sms->sms_insert($data);
        return $r;
    }

    /**
     * 通知短信
     */
    public function noticeSms($mobile,$text)
    {
        $Yunpian = new Yunpian();
        $sms = new Sms();
        $r = $Yunpian->signleSend($mobile, $text);
        Log::info(__FUNCTION__ . __LINE__ . ',start with draw pass,r=' , ['res'=>$r , 'text' => $text]);
        $data = [
            'mobile' => $mobile,
            'scene' =>  config("system.sms_scene.notice"),
            'message' => $text,
            'status' => $r['code'],
            'response' => json_encode($r),
        ];
        $sms->sms_insert($data);
        return $r;

    }

    /**
     * 验证验证码是否有效
     */
    public function verification($mobile,$scene,$code)
    {
        $sms = new Sms();
        $codeInfo = $sms->checkSms($mobile,$scene,$code);
        $codeInfo = json_decode(json_encode($codeInfo), true);
        if(empty($codeInfo)){
            return '验证码已过期';
        }else{
           if($codeInfo[0]['code'] != $code){
              return '验证码错误';
           }else{
              $data['status'] = config("system.sms_scene.validateSuccess");
              $sms->smsStatusUpdate($data);
              return true;
           }
        }
    }
}
