<?php

/**
 * Desc : 查询用户账户信息
 * Auth : 陈杰
 * Date : 2018/1/3
 */

use App\Fuiou\Lib\ApiBase;

class QueryAccount extends ApiBase
{
    // 必须参数
    const MUST_PARAMS = ['ver','mchnt_cd','mchnt_txn_ssn','mchnt_txn_dt','user_ids'];
    // 非必须参数
    const NO_MUST_PARAMS = [];
    // 不需要签名的参数
    const NO_SIGN_PARAMS = [];

    protected $ver;               // 版本号
    protected $mchnt_cd;         // 商户号
    protected $mchnt_txn_ssn;   // 订单号
    protected $mchnt_txn_dt;    // 交易查询日期
    protected $user_ids;         // 查询账户
}