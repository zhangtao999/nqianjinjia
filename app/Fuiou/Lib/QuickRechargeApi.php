<?php

/**
 * Desc : API快捷充值
 * Auth : 陈杰
 * Date : 2018/1/10
 */

use App\Fuiou\Lib\ApiBase;

class QuickRechargeApi extends ApiBase
{
    // 必须参数
    const MUST_PARAMS = ['mchnt_cd','mchnt_txn_ssn','txn_date','yzm'];
    // 非必须参数
    const NO_MUST_PARAMS = ['bank_mobile'];
    // 不需要签名的参数
    const NO_SIGN_PARAMS = [];

    protected $mchnt_cd;         // 商户号
    protected $mchnt_txn_ssn;   // 订单号
    protected $login_id;         // 交易查询日期
    protected $amt;               // 充值金额
    protected $bank_mobile;      // 银行预留手机号
    protected $card_no;           // 银行卡号
}