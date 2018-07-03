<?php

/**
 * Desc : 个人用户开户
 * Auth : 陈杰
 * Date : 2017/12/27 10:21
 */

use App\Fuiou\Lib\ApiBase;

class RegPersonAccount extends ApiBase
{
    // 必须参数
    const MUST_PARAMS = ['ver','mchnt_cd','mchnt_txn_ssn','cust_nm','certif_id','mobile_no','city_id','parent_bank_id','capAcntNo'];
    // 非必须参数
    const NO_MUST_PARAMS = ['email','bank_nm','capAcntNm','password','lpassword','rem'];
    // 不需要签名的参数
    const NO_SIGN_PARAMS = [];

    protected $ver;                  // 文档版本号，必填
    protected $mchnt_cd;            // 商户代码，必填
    protected $mchnt_txn_ssn;       // 流水号，必填
    protected $cust_nm;              // 客户姓名，必填
    protected $certif_id;            // 身份证号码/证件，必填
    protected $mobile_no;            // 手机号码，必填
    protected $email;                 // 邮箱地址，非必填
    protected $city_id;               // 开户行地区代码，必填
    protected $parent_bank_id;       // 开户行行别，必填
    protected $bank_nm;               // 开户行支行名称，非必填
    protected $capAcntNm;             // 户名，非必填
    protected $capAcntNo;             // 帐号，必填
    protected $password;              // 提现密码，不填默认为手机号后6位，非必填
    protected $lpassword;             // 登录密码，不填默认为手机号后6位，非必填
    protected $rem;                    // 备注，非必填
}