<?php

/**
 * Desc : 查询更换银行卡的结果
 * Auth : 陈杰
 * Date : 2018/5/23
 */

use App\Fuiou\Lib\ApiBase;

class QueryChangeBankCard extends ApiBase
{
    // 必须参数
    const MUST_PARAMS = ['mchnt_cd','mchnt_txn_ssn','login_id','txn_ssn'];
    // 非必须参数
    const NO_MUST_PARAMS = [];
    // 不需要签名的参数
    const NO_SIGN_PARAMS = [];

    protected $mchnt_cd;            // 商户代码，必填
    protected $mchnt_txn_ssn;      // 流水号，必填
    protected $login_id;            // 用户登录ID
    protected $txn_ssn;             // 交易流水
}