<?php

/**
 * Desc : 查询用户账户余额
 * Auth : 陈杰
 * Date : 2018/1/3
 */

use App\Fuiou\Lib\ApiBase;

class AccountBalance extends ApiBase
{
    // 必须参数
    const MUST_PARAMS = ['mchnt_cd','mchnt_txn_ssn','mchnt_txn_dt','cust_no'];
    // 非必须参数
    const NO_MUST_PARAMS = [];
    // 不需要签名的参数
    const NO_SIGN_PARAMS = [];

    protected $mchnt_cd;         // 商户号
    protected $mchnt_txn_ssn;   // 订单号
    protected $mchnt_txn_dt;    // 交易查询日期
    protected $cust_no;          // 查询账户
}