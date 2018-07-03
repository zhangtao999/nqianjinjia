<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;

class Controller extends BaseController {

    use AuthorizesRequests,
        DispatchesJobs,
        ValidatesRequests;

    public function __construct(Request $request) {
        ;
    }

    /**
     * 返回正确的处理结果
     * @param $datas //返回值
     * @param $msg //消息体
     * @param $back //是否返回，true 返回，false 直接输出
     * @return string
     */
    public function success($datas, $msg = '',$back=false ) {
        $data_export = array();
        $data_export['code'] = config('system.code.ok');
        $data_export['msg'] = $msg;
        $data_export['datas'] = $datas;
        if($back) {
            return json_encode($data_export,JSON_NUMERIC_CHECK);
        }else {
            echo json_encode($data_export);
            exit;
        }
    }

    /**
     * 返回错误的效果消息
     *
     * @param $message  //错误消息
     * @param $error_code
     * @return string
     */
    public function failed($message, $error_code = "", $back=false ) {
        $data = array();
        $data['code'] = $error_code ? $error_code : config('system.code.error');
        $data['msg'] = $message;
        if($back) {
            return json_encode($data);
        }else {
            echo json_encode($data);
            exit;
        }
    }

    //成功,但是没有数据
    public function dataNullSuccess($message)
    {
        $data_export = array();
        $data_export['code'] = config('system.code.ok');
        $data_export['msg'] = $message;

        echo json_encode($data_export);
        exit;
    }

    //通用错误
    public function commonFailed($message, $error_code = "")
    {
        $data         = array();
        $data['code'] = $error_code ? $error_code : config('system.code.common_error');
        $data['msg']  = $message;
        echo json_encode($data);
        exit;
    }

}
