<?php
/**
 * Desc : 法人开户
 * Auth : 卫伟
 * Date : 2017/12/28 9:30
 */

use App\Fuiou\Lib\ApiBase;

class FirmPersonAccount extends ApiBase
{
    // 必须参数
    const MUST_PARAMS = ['ver','mchnt_cd','mchnt_txn_ssn','cust_nm','artif_nm','certif_id','mobile_no','city_id','parent_bank_id','capAcntNo'];
    // 非必须参数
    const NO_MUST_PARAMS = ['email','bank_nm','password','lpassword','rem'];
    // 不需要签名的参数
    const NO_SIGN_PARAMS = [];

    protected $ver;                 // 文档版本号
    protected $mchnt_cd;            // 商户代码
    protected $mchnt_txn_ssn;      // 流水号
    protected $cust_nm;             // 企业名称
    protected $artif_nm;            // 法人姓名
    protected $certif_id;           // 身份证号码
    protected $mobile_no;           // 手机号
    protected $email;                // 邮箱  非必须
    protected $city_id;              // 开户行地区代码
    protected $parent_bank_id;      // 开户行行别
    protected $bank_nm;              // 开户行支行名称  非必须
    protected $capAcntNo;            // 账号
    protected $password;             // 提现密码 非必填
    protected $lpassword;            // 登陆密码 非必填
    protected $rem;                   // 备注  非必填

}