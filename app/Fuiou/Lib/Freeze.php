<?php

/**
 * Desc : 冻结资金
 * Auth : 陈杰
 */

use App\Fuiou\Lib\ApiBase;

class Freeze extends ApiBase
{
    // 必须参数
    const MUST_PARAMS = ['ver','mchnt_cd','mchnt_txn_ssn','cust_no','amt'];
    // 非必须参数
    const NO_MUST_PARAMS = ['rem'];
    // 不需要签名的参数
    const NO_SIGN_PARAMS = [];

    protected $ver;               // 版本号
    protected $mchnt_cd;         // 商户号
    protected $mchnt_txn_ssn;   // 订单号
    protected $cust_no;          // 用户账户
    protected $amt;               // 金额
    protected $rem;               // 备注
}