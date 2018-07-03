<?php

/**
 * Desc : 用户之间资金转账
 * Auth : 陈杰
 * Date : 2018/5/8
 */

use App\Fuiou\Lib\ApiBase;

class TransferAccounts extends ApiBase
{
    // 必须参数
    const MUST_PARAMS = ['ver','mchnt_cd','mchnt_txn_ssn','out_cust_no','in_cust_no','amt'];
    // 非必须参数
    const NO_MUST_PARAMS = ['contract_no','rem'];
    // 不需要签名的参数
    const NO_SIGN_PARAMS = [];

    protected $ver;               // 版本号
    protected $mchnt_cd;         // 商户号
    protected $mchnt_txn_ssn;   // 订单号
    protected $out_cust_no;     // 付款账户开户手机号
    protected $in_cust_no;      // 收款账户开户手机号
    protected $amt;              // 划拨金额，单位为分
    protected $contract_no;     // 预授权合同号
    protected $rem;              // 备注
}