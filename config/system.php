<?php

/*
 * 系统业务配置参数，包括一些错误提示文字配置
 */

return [

    /*
      |--------------------------------------------------------------------------
      | app key
      |--------------------------------------------------------------------------
      |
      | 使用 app key 来生成签名 sign,
      | timestamp: 10 位时间戳
      | sign 计算方式： sign = md5( timestamp + app key )
     */
    'app-key' => 'UtOCzqb67d3sN12Kts4URwy8',

    /*
      |--------------------------------------------------------------------------
      | 错误代码
      |--------------------------------------------------------------------------
      |
      | 对外提供的接口访问，返回 JSON 格式数据中的 code 错误吗
     */
    'code' => [
        'ok'                       => 200, //请求正常
        'unauthorized'             => 401, //未授权Unauthorized
        'forbidden'                => 403, //Forbidden
        'many_requests'            => 429, //限制时间内调用太多次
        'validate_mobile'          => 411, //验证手机号
        'sms_error'                => 413, //验证码错误
        'qjj_regist_error'         => 604, //注册错误，重复注册
        'qjj_sign_error'           => 600, //登录错误，密码或用户名错误
        'qjj_login_error'          => 601, //登录错误，密码或用户名错误
        'qjj_authentication_error' => 602, //实名认证失败
        'qjj_apply_error'          => 603, //实名认证失败
        'empty_parameter'          => 604, //参数为空
        'db_error'           => 605, //操作数据库出错
        'pay_error'          => 606, //支付密码错误
        'fy_pay_error'       => 607, //富友支付错误
        'regist_db_error'    => 608, //注册存库出现错误
        'not_same_pwd'       => 608, //密码不一致
        'curl_error'         => 609, //curl出错
        'idcard_error'       => 610, //身份证号码与实名不一致
        'contact_info_error' => 611, //获取借款人信息失败
        'fy_mobile_error'    => 612, //fy手机号错误
        'is_lenderinvest'    => 613, //两端不能同时有借款或出借
        'common_error'       => 614, //通用业务错误
        'page_error'         => 415, //页码错误
    ],

    'sms_scene' => [
        'verify' => 1,  //通用验证码
        'forget' => 2,  //忘记密码
        'notice' => 3,  //通知短信
        'effectiveTime' => '20', //验证码有效时间 单位（分）
        'sendSuccess' => '0', //发送成功未验证
        'validateSuccess' => '1', //发送成功并验证成功
    ],
    /*
      |--------------------------------------------------------------------------
      | 运营系统错误代码
      |--------------------------------------------------------------------------
      |
      | 对外提供的接口访问，返回 JSON 格式数据中的 code 错误吗
     */
    'bkcode' => [
        'login_error'  => 6001, //用户名或密码错误
        'logout_error'  => 6002, //退出登录失败
        'create_error'  => 6003, //创建失败
        'delete_error'  => 6004, //删除失败
        'edit_error'  => 6005, //编辑失败
        'recover_error' => 6006, //恢复失败
        'set_error' => 6007, //设置失败
        'approve_failed' => 6008, //审核失败
        'project_generate_failed' => 6009, //生成标的失败
        'lock_failed' => 6010, //账号锁定失败
        'unlock_failed' => 6011, //账号解锁失败
        'send_redpacket_failed' => 6012, //发送红包失败
    ],

    // 挖宝法人账户
    'fy_platform_legal_account' => 'A1',
    // 挖宝平台账户
    'fy_platform_account' => env('FY_PLATFORM_ACCOUNT'),

    //聚信立接口
    'juxinli' => [
        'account'             => 'wabaojinrong', //机构号
        'client_secret'       => '4967aa866e3246afb8d95df756309ce6', //私钥
        'get_token_url'       => 'https://www.juxinli.com/orgApi/rest/v3/applications/', //https://www.juxinli.com/orgApi/rest/v3/applications/{orgAccount}
        'get_data_url'        => 'https://www.juxinli.com/orgApi/rest/v2/messages/collect/req', //请求采集接口
        'update_pwd_url'      => 'https://www.juxinli.com/orgApi/rest/v2/messages/reset/req', //修改服务商密码
        'get_info_token_time' => 'https://www.juxinli.com/api/v2/access_report_token', //拿获取信息接口的token
        'get_info_by_token'   => 'https://www.juxinli.com/api/access_report_data_by_token', //通过token获取客户信息
    ],
];
