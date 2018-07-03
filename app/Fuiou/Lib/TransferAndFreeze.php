<?php

/**
 * Desc : 划拨预冻结
 * Auth : 陈杰
 */

use App\Fuiou\Lib\ApiBase;

class TransferAndFreeze extends ApiBase
{
    // 必须参数
    const MUST_PARAMS = ['ver','mchnt_cd','mchnt_txn_ssn','out_cust_no','in_cust_no','amt'];
    // 非必须参数
    const NO_MUST_PARAMS = ['rem'];
    // 不需要签名的参数
    const NO_SIGN_PARAMS = [];

    protected $ver;               // 版本号
    protected $mchnt_cd;         // 商户号
    protected $mchnt_txn_ssn;   // 订单号
    protected $out_cust_no;     // 付款登录账户
    protected $in_cust_no;      // 收款登录账户
    protected $amt;               // 交易金额
    protected $rem;               // 备注
}