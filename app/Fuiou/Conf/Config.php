<?php

$serverName = !empty($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : '';
if($serverName) {
    if(!strstr($serverName, 'http')) {
        $serverName = "https://".$serverName;
    }
    $devServerName = $proServerName = rtrim($serverName, '/');
}else {
    $devServerName = 'https://api.mymoneygohome.com';
    $proServerName = 'https://preapi.mymoneygohome.com';
}

$fuiouConfig = [
    // 商户号
    'mchnt_cd'  => [
        'dev'   => '0001000F0096241',
        'pro'   => '0002900F0282229',
    ],
    // 版本号
    'ver'        => [
        'dev'   => '0.44',
        'pro'   => '0.44',
    ],
    // 商户返回地址
    'page_notify_url' => [
        'personQuickRecharge'  => [
            'dev'   => $devServerName.'',
            'pro'   => $proServerName.''
        ],
        'personQuickWithdraw'  => [
            'dev'   => $devServerName.'',
            'pro'   => $proServerName.''
        ],
        'onLineSign' => [
            'dev'   => $devServerName.'/loan/v403/bankSignNotify',
            'pro'   => $proServerName.'/loan/v403/bankSignNotify',
        ],
    ],
    // 商户回调地址
    'back_notify_url' => [
        'personQuickRecharge'  => [
            'dev'   => $devServerName.'',
            'pro'   => $proServerName.''
        ],
        'personQuickWithdraw'  => [
            'dev'   => $devServerName.'',
            'pro'   => $proServerName.''
        ],
        'entrustRecharge'       => [
            'dev'   => $devServerName.'',
            'pro'   => $proServerName.''
        ],
        'entrustWithdraw'       => [
            'dev'   => $devServerName.'/invest/v1/entrustWithdrawNotice',
            'pro'   => $proServerName.'/invest/v1/entrustWithdrawNotice'
        ],
    ],
    // 公钥
    'pbKey'     => [
        'dev'   => 'dev_pbkey.pem',
        'pro'   => 'pro_pbkey.pem',
    ],
    // 私钥
    'prKey'     => [
        'dev'   => 'dev_prkey.pem',
        'pro'   => 'pro_prkey.pem'
    ],
    // 接口列表
    'apiList'  => [
        'regPersonAccount'      => '个人用户开户，调用方法regPersonAccount()',
        'firmPersonAccount'     => '法人开户，调用方法firmPersonAccount()',
        'personQuickRecharge'   => '个人用户快捷充值，调用方法personQuickRecharge()',
        'personQuickWithdraw'   => '个人用户快速提现，调用方法personQuickWithdraw()',
        'transferFund'           => '用户之间资金划拨，调用方法transferFund()',
        'accountBalance'         => '查询用户账户余额，调用方法accountBalance()',
        'queryAccount'           => '查询用户账户信息，调用方法queryAccount()',
        'tradeRecord'            => '查询用户交易记录，调用方法tradeRecord()',
        'entrustRecharge'       => '用户委托充值，调用方法entrustRecharge()',
        'onLineSign'             => '用户在线签约，调用方法onLineSign()',
        'entrustWithdraw'       => '用户委托提现，调用方法entrustWithdraw()',
        'quickRechargeSendSms' => 'API快捷充值发送短信验证码，调用方法quickRechargeSendSms()',
        'quickRechargeApi'      => 'API快捷充值，调用方法quickRechargeApi()',
        'transferAccounts'      => '用户和平台资金转账，调用方法transferAccounts()',
        'changeBankCard'        => '更换银行卡，调用方法changeBankCard()',
        'queryChangeBankCard'  => '查询更换银行卡的结果，调用方法queryChangeBankCard()',
        'freeze'                 => '冻结资金，调用方法freeze()',
        'unFreeze'               => '解冻资金，调用方法unFreeze()',
        'transferAndFreeze'    => '划拨预冻结，调用方法transferAndFreeze()',
    ],
    // 个人用户开户
    'regPersonAccount'    => [
        'dev'  => 'https://jzh-test.fuiou.com/jzh/reg.action',
        'pro'  => 'https://jzh.fuiou.com/reg.action',
    ],
    // 企业用户开户
    'firmPersonAccount'   => [
        'dev'  => 'https://jzh-test.fuiou.com/jzh/artifReg.action',
        'pro'  => 'https://jzh.fuiou.com/artifReg.action',
    ],
    // 个人用户快捷充值
    'personQuickRecharge' => [
        'dev'  => 'https://jzh-test.fuiou.com/jzh/app/500002.action',
        'pro'  => 'https://jzh.fuiou.com/app/500002.action',
    ],
    // 个人用户快速提现
    'personQuickWithdraw' => [
        'dev'  => 'https://jzh-test.fuiou.com/jzh/app/500003.action',
        'pro'  => 'https://jzh.fuiou.com/app/500003.action',
    ],
    // 用户之间资金划拨
    'transferFund'  => [
        'dev'  => 'https://jzh-test.fuiou.com/jzh/transferBu.action',
        'pro'  => 'https://jzh.fuiou.com/transferBu.action'
    ],
    // 查询用户账户余额
    'accountBalance' => [
        'dev' => 'https://jzh-test.fuiou.com/jzh/BalanceAction.action',
        'pro' => 'https://jzh.fuiou.com/BalanceAction.action'
    ],
    // 查询用户账户信息
    'queryAccount' => [
        'dev' => 'https://jzh-test.fuiou.com/jzh/queryUserInfs.action',
        'pro' => 'https://jzh.fuiou.com/queryUserInfs.action'
    ],
    // 查询用户交易记录
    'tradeRecord' => [
        'dev' => 'https://jzh-test.fuiou.com/jzh/queryTxn.action',
        'pro' => 'https://jzh.fuiou.com/queryTxn.action'
    ],
    // 用户委托充值
    'entrustRecharge' => [
        'dev' => 'https://jzh-test.fuiou.com/jzh/wtrecharge.action',
        'pro' => 'https://jzh.fuiou.com/wtrecharge.action',
    ],
    // 用户在线签约
    'onLineSign' => [
        'dev' => 'https://jzh-test.fuiou.com/jzh/app/appSign_card.action',
        'pro' => 'https://jzh.fuiou.com/app/appSign_card.action'
    ],
    // 委托提现
    'entrustWithdraw' => [
        'dev' => 'https://jzh-test.fuiou.com/jzh/wtwithdraw.action',
        'pro' => 'https://jzh.fuiou.com/wtwithdraw.action'
    ],
    // API快捷充值发送短信验证码
    'quickRechargeSendSms' => [
        'dev' => 'https://jzh-test.fuiou.com/jzh/mpay_sendSms.action',
        'pro' => 'https://jzh.fuiou.com/mpay_sendSms.action'
    ],
    // API快捷充值
    'quickRechargeApi' => [
        'dev' => 'https://jzh-test.fuiou.com/jzh/mpay_sendPay.action',
        'pro' => 'https://jzh.fuiou.com/mpay_sendPay.action'
    ],
    // 用户与平台之间资金转账
    'transferAccounts' => [
        'dev' => 'https://jzh-test.fuiou.com/jzh/transferBmu.action',
        'pro' => 'https://jzh.fuiou.com/transferBmu.action'
    ],
    // 更换银行卡
    'changeBankCard' => [
        'dev' => 'https://jzh-test.fuiou.com/jzh/userChangeCard.action',
        'pro' => 'https://jzh.fuiou.com/userChangeCard.action'
    ],
    // 查询更换银行卡
    'queryChangeBankCard' => [
        'dev' => 'https://jzh-test.fuiou.com/jzh/queryChangeCard.action',
        'pro' => 'https://jzh.fuiou.com/queryChangeCard.action'
    ],
    // 冻结资金
    'freeze' => [
        'dev' => 'https://jzh-test.fuiou.com/jzh/freeze.action',
        'pro' => 'https://jzh.fuiou.com/freeze.action'
    ],
    // 解冻资金
    'unFreeze' => [
        'dev' => 'https://jzh-test.fuiou.com/jzh/unFreeze.action',
        'pro' => 'https://jzh.fuiou.com/unFreeze.action'
    ],
    // 划拨预冻结
    'transferAndFreeze' => [
        'dev' => 'https://jzh-test.fuiou.com/jzh/transferBuAndFreeze.action',
        'pro' => 'https://jzh.fuiou.com/transferBuAndFreeze.action'
    ]
];

return $fuiouConfig;