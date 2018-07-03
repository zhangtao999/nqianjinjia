<?php

/**
 * Desc : 查询用户交易记录
 * Auth : 陈杰
 * Date : 2018/1/4
 */

use App\Fuiou\Lib\ApiBase;

class TradeRecord extends ApiBase
{
    // 必须参数
    const MUST_PARAMS = ['mchnt_cd','mchnt_txn_ssn','busi_tp','start_day','end_day'];
    // 非必须参数
    const NO_MUST_PARAMS = ['txn_ssn','cust_no','txn_st','remark','page_no','page_size'];
    // 不需要签名的参数
    const NO_SIGN_PARAMS = [];

    protected $mchnt_cd;         // 商户号
    protected $mchnt_txn_ssn;   // 订单号
    protected $busi_tp;          // 交易类型
    protected $start_day;       // 起始时间
    protected $end_day;         // 结束时间
    protected $txn_ssn;         // 预授权合同号
    protected $cust_no;         // 用户开户手机号
    protected $txn_st;          // 交易状态
    protected $remark;          // 交易备注
    protected $page_no;         // 页码
    protected $page_size;      // 每页条数
}