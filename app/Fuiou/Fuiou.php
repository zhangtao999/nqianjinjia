<?php

namespace App\Fuiou;

use App\Fuiou\Lib\ApiBase;

class Fuiou
{

    const MODE_DEV = 'dev';
    const MODE_PRO = 'pro';
    const API_NO_FOUND = '接口不存在';
    const SIGN_DATA_ERROR = '签名数据错误';

    private $libPath;       // 类库的绝对目录
    private $config;        // 配置文件
    private $mode;          // 接口模式，dev/开发模式，pro/生产模式
    private $apiName;       // 接口名称
    private $fuiou;         // 被调用的支付对象

    public function __construct()
    {
        $this->libPath = dirname(__FILE__);
        $this->config = require $this->libPath.'/Conf/Config.php';
        $this->mode = in_array(env("APP_ENV"), array("production")) ? self::MODE_PRO : self::MODE_DEV;   // 默认为生产模式
    }

    public function setModeDev()
    {
		//exit('禁用开发模式');
        $this->mode = self::MODE_DEV;
        return $this->setConfig();
    }

    public function setModePro()
    {
        $this->mode = self::MODE_PRO;
        return $this->setConfig();
    }

    public function getApiList()
    {
        return $this->config['apiList'];
    }

    public function getApiParamsList()
    {
        if($this->fuiou) {
            $apiName = $this->apiName;
            $mustParams = !empty($apiName::MUST_PARAMS) ? $apiName::MUST_PARAMS : [];
            $noMustParams = !empty($apiName::NO_MUST_PARAMS) ? $apiName::NO_MUST_PARAMS : [];
            return [
                'mustParams'    => $mustParams,
                'noMustParams'  => $noMustParams
            ];
        }else {
            exit(self::API_NO_FOUND);
        }
    }

    public function __call($name, $arguments)
    {
        if(in_array($name, array_keys($this->config['apiList']))) {
            $this->apiName = $name;
            require_once $this->libPath.'/Lib/ApiBase.php';
            $name = ucfirst($name);
            if(file_exists($this->libPath.'/Lib/'.$name.'.php')) {
                require_once $this->libPath.'/Lib/'.$name.'.php';
                $this->fuiou = new $name;
                return $this->setConfig($arguments);
            }
        }
        exit(self::API_NO_FOUND);
    }

    private function setConfig()
    {
        if($this->fuiou) {
            $this->fuiou->setClassName($this->apiName);

            $prKey = $this->libPath.'/Conf/'.$this->config['prKey'][$this->mode];
            $this->fuiou->setPrKey($prKey);
            unset($this->config['prKey']);

            $pbKey = $this->libPath.'/Conf/'.$this->config['pbKey'][$this->mode];
            $this->fuiou->setPbKey($pbKey);
            unset($this->config['pbKey']);

            $this->fuiou->setApiUrl($this->config[$this->apiName][$this->mode]);

            $this->fuiou->setMchntTxnSsn();

            foreach ($this->config as $key=>$val) {
                if(property_exists($this->fuiou, $key)) {
                    $keyName = explode('_', $key);
                    $keyName1 = '';
                    foreach ($keyName as $tmp) {
                        $keyName1 .= ucfirst($tmp);
                    }
                    $functionName = 'set'.$keyName1;
                    $paramsVaule = '';
                    if(isset($this->config[$key][$this->apiName][$this->mode])) {
                        $paramsVaule = $this->config[$key][$this->apiName][$this->mode];
                    }elseif(isset($this->config[$key][$this->mode])) {
                        $paramsVaule = $this->config[$key][$this->mode];
                    }
                    $this->fuiou->$functionName($paramsVaule);
                }
            }
        }

        return true;
    }

    public function getRequestData($data)
    {
        if($this->fuiou) {
            $this->fuiou->verifyParams($data) &&
            $this->fuiou->buildSignStr() &&
            $this->fuiou->rsaSign() &&
            $this->fuiou->buildRequestParams();
            return $this->fuiou->getRequestParams();
        }else {
            exit(self::API_NO_FOUND);
        }
    }

    public function request($data)
    {
        if($this->fuiou) {
            $this->fuiou->verifyParams($data) &&
            $this->fuiou->buildSignStr() &&
            $this->fuiou->rsaSign() &&
            $this->fuiou->buildRequestParams() &&
            $this->fuiou->sendPostRequest();
            $apiName = $this->apiName;
            if($this->fuiou->getCode() == $apiName::CODE_ERROR) {
                return $this->fuiou->getResult();
            }
        }else {
            exit(self::API_NO_FOUND);
        }
    }

    public function response()
    {
        $apiName = $this->apiName;
        if($this->fuiou->getCode() == $apiName::CODE_ERROR) {
            return $this->fuiou->getResult();
        }else {
            $this->fuiou->analysisResponse();
            return $this->fuiou->getResult();
        }
    }

    public function verifySign($data)
    {
        if(!empty($data['signature'])) {
            $sign = utf8_encode($data['signature']);
            unset($data['signature']);
            ksort($data);
            $signData = implode('|', $data);

            require_once $this->libPath.'/Lib/ApiBase.php';
            empty($this->fuiou) && $this->fuiou = new ApiBase();
            $pbKey = $this->libPath.'/Conf/'.$this->config['pbKey'][$this->mode];
            $this->fuiou->setPbKey($pbKey);

            return $this->fuiou->returnVerifySign($sign, $signData);
        }
        exit(self::SIGN_DATA_ERROR);
    }

    public function getConfigMchntCd()
    {
        return $this->config['mchnt_cd'][$this->mode];
    }

    public function getConfigApiUrl()
    {
        return $this->config[$this->apiName][$this->mode];
    }

    public function dealSign($data)
    {
        require_once $this->libPath.'/Lib/ApiBase.php';
        empty($this->fuiou) && $this->fuiou = new ApiBase();
        $prKey = $this->libPath.'/Conf/'.$this->config['prKey'][$this->mode];
        $this->fuiou->setPrKey($prKey);
        return $this->fuiou->rsaSign($data);
    }

    public function setMchntTxnSsn($mchntTxnSsn)
    {
        if($this->fuiou) {
            $this->fuiou->setMchntTxnSsn($mchntTxnSsn);
        }else {
            exit(self::API_NO_FOUND);
        }

        return true;
    }
}