<?php

namespace App\Http\Middleware;

use Closure;

class VerifySign {

    /**
     * X-QJJ-Sign校验
     * 规则：sign = md5( timestamp + App Key )
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next) {

        $x_qjj_sign = $request->header('X-QJJ-Sign');

        //开发环境、测试环境不做校验
        if (in_array(env("APP_ENV"), array("local", "testing"))) {
            return $next($request);
        }

        // 过滤一些路由
        $noSignRoutes = [
            "invest/v1/entrustWithdrawNotice",
            "invest/v1/entrustWithdrawFailNotice",
            "loan/v403/bankSignNotify"
        ];
        if (in_array($request->path(), $noSignRoutes)) {
            return $next($request);
        }

        try {
            list($sign, $timestamp) = explode(",", $x_qjj_sign);
            //时间戳3分钟有效，并且签名正确
            if (time() - $timestamp > 180 || md5($timestamp . config("system.app-key")) != $sign) {
                return response()->json(array('code' => config("system.code.qjj_sign_error"), 'msg' => 'invalid sign'));
            }
        } catch (\Exception $e) {
            return response()->json(array('code' => config("system.code.qjj_sign_error"), 'msg' => 'invalid sign'));
        }

        return $next($request);
    }

}
