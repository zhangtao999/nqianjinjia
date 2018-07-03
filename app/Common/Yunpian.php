<?php

namespace App\Common;

use \Yunpian\Sdk\YunpianClient;

class Yunpian {

    /**
     * 发送短信
     *
     * @param string $mobile 手机号码
     * @param string $text 短信文本
     *
     * @return array
     */
    public function signleSend($mobile, $text) {        
        $apikey = "524bd9a324ce80c79f73e46c0134a55e";
        //初始化apikey
        $clnt = YunpianClient::create($apikey);
        $param = [YunpianClient::MOBILE => $mobile, YunpianClient::TEXT => $text];
        $r = $clnt->sms()->single_send($param);
        //code 0正确 其他错误码见云片官方文档
        return ['code' => $r->code(), 'msg' => $r->code() ? $r->detail() : $r->msg(), 'data' => $r->data()];
    }

}
