<?php

/**
 * Desc : 用户委托提现
 * Auth : 陈杰
 * Date : 2018/1/6
 */

use App\Fuiou\Lib\ApiBase;

class EntrustWithdraw extends ApiBase
{
    // 必须参数
    const MUST_PARAMS = ['mchnt_cd','mchnt_txn_ssn','login_id','amt','back_notify_url'];
    // 非必须参数
    const NO_MUST_PARAMS = ['rem'];
    // 不需要签名的参数
    const NO_SIGN_PARAMS = [];

    protected $mchnt_cd;            // 商户号
    protected $mchnt_txn_ssn;      // 流水号
    protected $login_id;            // 用户开户手机号
    protected $amt;                  // 提现金额
    protected $back_notify_url;    // 商户后台通知地址
    protected $rem;                  // 备注
}