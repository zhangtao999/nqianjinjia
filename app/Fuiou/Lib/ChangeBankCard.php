<?php

/**
 * Desc : 更换银行卡
 * Auth : 陈杰
 * Date : 2018/5/23
 */

use App\Fuiou\Lib\ApiBase;

class ChangeBankCard extends ApiBase
{
    // 必须参数
    const MUST_PARAMS = ['ver','mchnt_cd','mchnt_txn_ssn','login_id','city_id','bank_cd','card_no','file1'];
    // 非必须参数
    const NO_MUST_PARAMS = ['file2'];
    // 不需要签名的参数
    const NO_SIGN_PARAMS = ['ver', 'file1','file2'];

    protected $ver;                  // 文档版本号，必填
    protected $mchnt_cd;            // 商户代码，必填
    protected $mchnt_txn_ssn;      // 流水号，必填
    protected $login_id;            // 用户登录ID
    protected $city_id;             // 开户行地区代码
    protected $bank_cd;             // 提现账户开户行
    protected $card_no;             // 银行账户
    protected $file1;               // 图片1
    protected $file2;               // 图片2
}