<?php

/**
 * Desc : 用户在线签约
 * Auth : 陈杰
 * Date : 2018/1/5
 */

use App\Fuiou\Lib\ApiBase;

class OnLineSign extends ApiBase
{
    // 必须参数
    const MUST_PARAMS = ['mchnt_cd','mchnt_txn_ssn','login_id','mobile','page_notify_url'];
    // 非必须参数
    const NO_MUST_PARAMS = [];
    // 不需要签名的参数
    const NO_SIGN_PARAMS = [];

    protected $mchnt_cd;            // 商户号
    protected $mchnt_txn_ssn;      // 流水号
    protected $login_id;            // 用户开户手机号
    protected $mobile;              // 银行预留手机号
    protected $page_notify_url;    // 商户返回地址
}