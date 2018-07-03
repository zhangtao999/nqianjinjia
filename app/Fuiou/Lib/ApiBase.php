<?php

namespace App\Fuiou\Lib;

class ApiBase
{
    const CODE_SUCCESS = 1;
    const CODE_ERROR = 0;
    const XML_ERROR = '非法的xml数据';
    const SIGN_FAIL = '验签失败';

    protected $code;
    protected $msg;

    protected $className;          // 类名/接口名
    protected $apiUrl;             // 富友接口地址
    protected $prKey;              // 私钥文件
    protected $pbKey;              // 公钥文件
    protected $signature;          // 签名信息，必填
    protected $sortParams;        // 排序后，组装好的参数串
    protected $requestParams;     // 请求接口的参数数组
    protected $apiResponse;       // 接口响应

    protected function setCodeSuccess()
    {
        return $this->code = self::CODE_SUCCESS;
    }

    protected function setCodeError()
    {
        return $this->code = self::CODE_ERROR;
    }

    public function getCode()
    {
        return $this->code;
    }

    protected function setMsg($msg)
    {
        if(!empty($msg)) {
            if(!empty($this->msg)) {
                if(is_array($msg)) {
                    $this->msg = array_merge($this->msg, $msg);
                }else {
                    $this->msg[] = $msg;
                }
            }else {
                if(is_array($msg)) {
                    $this->msg = $msg;
                }else {
                    $this->msg = [$msg];
                }
            }
        }else {
            $this->msg = null;
        }

        return true;
     }

    public function getResult()
    {
        if(!isset($this->code)) {
            $this->code = self::CODE_SUCCESS;
        }
        return [
            'code'  => $this->code,
            'msg'   => $this->msg,
        ];
    }

    public function setClassName($className)
    {
        return $this->className = $className;
    }

    public function verifyParams($params)
    {
        $className = $this->className;
        foreach ($className::MUST_PARAMS as $val) {
            if(isset($this->$val)) {
                continue;
            }
            if(!isset($params[$val])) {
                $this->setCodeError();
                $this->setMsg("参数{$val}不能为空");
            }else {
                $this->$val = $params[$val];
            }
        }
        foreach ($className::NO_MUST_PARAMS as $val) {
            isset($params[$val]) && $this->$val = $params[$val];
        }

        if($this->getCode() === self::CODE_ERROR) {
            return false;
        }
        return true;
    }

    public function setVer($ver)
    {
        return $this->ver = $ver;
    }

    public function setMchntCd($mchntCd)
    {
        return $this->mchnt_cd = $mchntCd;
    }

    public function setPrKey($prkey)
    {
        return $this->prKey = $prkey;
    }

    public function setPbKey($pbkey)
    {
        return $this->pbKey = $pbkey;
    }

    public function setApiUrl($apiUrl)
    {
        return $this->apiUrl = $apiUrl;
    }

    public function setMchntTxnSsn($mchntTxnSsn='')
    {
        if(!empty($mchntTxnSsn)) {
            return $this->mchnt_txn_ssn = $mchntTxnSsn;
        }else {
            return $this->mchnt_txn_ssn = date('YmdHis').rand(1000,9999);
        }
    }

    public function setPageNotifyUrl($pageNotifyUrl)
    {
        return $this->page_notify_url = $pageNotifyUrl;
    }

    public function setBackNotifyUrl($backNotifyUrl)
    {
        return $this->back_notify_url = $backNotifyUrl;
    }

    public function buildSignStr()
    {
        $className = $this->className;
        $allParams = array_merge($className::MUST_PARAMS, $className::NO_MUST_PARAMS);
        $allParams = array_diff($allParams, $className::NO_SIGN_PARAMS);
        sort($allParams);
        $sortParams = [];
        foreach ($allParams as $val) {
            $sortParams[] = $this->$val;
        }
        return $this->sortParams = implode('|', $sortParams);
    }

    public function buildRequestParams()
    {
        $className = $this->className;
        $allParams = array_merge($className::MUST_PARAMS, $className::NO_MUST_PARAMS);
        foreach ($allParams as $val) {
            $this->requestParams[$val] = $this->$val;
        }
        $this->requestParams['signature'] = $this->signature;

        return $this->requestParams;
    }

    public function getRequestParams()
    {
        if($this->requestParams) {
            $this->setCodeSuccess();
            $this->setMsg($this->requestParams);
        }else {
            $this->setCodeError();
        }

        return $this->getResult();
    }

    /**
     * 签名方法，也可以外部传参调用
     * @param $oriString
     * @return string
     */
    public function rsaSign($oriString='')
    {
        $prKey = file_get_contents($this->prKey);
        $res = openssl_get_privatekey($prKey);
        if(!empty($oriString)) {
            openssl_sign($oriString, $sign, $res);
        }else {
            openssl_sign($this->sortParams, $sign, $res);
        }
        openssl_free_key($res);
        return $this->signature = base64_encode($sign);
    }

    public function sendPostRequest()
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->apiUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // https请求，不验证证书和hosts
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $this->requestParams);//print_r($this->requestParams);exit;
        $result = curl_exec($ch);//var_dump($result);exit;
        curl_close($ch);
        return $this->apiResponse = $result;
    }

    public function analysisResponse()
    {
        $xml = xml_parser_create();
        if(!xml_parse($xml, $this->apiResponse, true)){
            xml_parser_free($xml);
            $this->setCodeError();
            $this->setMsg(self::XML_ERROR);
            return false;
        }else {
            if(!$this->verifySign()) {
                $this->setCodeError();
                $this->setMsg(self::SIGN_FAIL);
                return false;
            }
            libxml_disable_entity_loader(true);
            $this->apiResponse = simplexml_load_string($this->apiResponse, 'SimpleXMLElement', LIBXML_NOCDATA);
            $this->apiResponse = json_decode(json_encode($this->apiResponse),true);
            $this->setCodeSuccess();
            $this->setMsg($this->apiResponse['plain']);
            return true;
        }
    }

    public function verifySign()
    {
        $start = strpos($this->apiResponse, '<plain>');
        $end = strpos($this->apiResponse, '</plain>');
        $oriContent = substr($this->apiResponse,$start,$end-$start+strlen('</plain>'));
        $start = strpos($this->apiResponse, '<signature>');
        $end = strpos($this->apiResponse, '</signature>');
        $signContent = substr($this->apiResponse,$start+strlen('</signature>')-1,$end-$start-strlen('</signature>')+1);
        $pbKey = file_get_contents($this->pbKey);
        $res = openssl_get_publickey($pbKey);
        $result = (bool)openssl_verify($oriContent, base64_decode($signContent), $res);
        openssl_free_key($res);
        return $result;
    }

    public function returnVerifySign($signStr, $signData)
    {
        $pbKey = file_get_contents($this->pbKey);
        $res = openssl_get_publickey($pbKey);
        $result = (bool)openssl_verify($signData, base64_decode($signStr), $res);
        openssl_free_key($res);
        return $result;
    }
}