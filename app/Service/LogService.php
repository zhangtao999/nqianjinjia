<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Service;

use App\Model\UserPlatform;
use App\Model\AppVersion;

/**
 * Description of LogService
 *
 * @author mashouchao
 */
class LogService {

    /**
     * 系统启动,记录用户启动日志
     *
     * @param array params 参数
     * @param string  type 理财端'invest'，借款端'loan'
     * 
     * @return string token
     */
    public function Start($params, $type) {
        $exist = UserPlatform::where('device_id', $params['device_id'])->count();
        if (!$exist) {
            $userPlatform = new UserPlatform();
            $userPlatform->device_id = $params['device_id'];
            $userPlatform->platform = $params['platform'];
            $userPlatform->version = $params['version'];
            $userPlatform->register_id = $params['register_id'];

            $userPlatform->save();
        } else {
            UserPlatform::where('device_id', $params['device_id'])
                    ->update([
                        'platform' => $params['platform'],
                        'version' => $params['version'],
                        'register_id' => $params['register_id']
            ]);
        }

        return $this->getVersion($params['platform'],$type);
    }

    /**
     * 登陆平台记录
     *
     * @param string $device_id 设备号
     * @param int $user_id 用户编号
     * 
     * @return string token
     */
    public function Login($device_id, $user_id) {
        return UserPlatform::where('device_id', $device_id)
                        ->update(['user_id' => $user_id, 'logindate' => date('Y-m-d H:i:s', time())]);
    }

    /**
     * 退出平台记录
     *
     * @param string $device_id 设备号
     * @param int $user_id 用户编号
     * 
     * @return string token
     */
    public function Logout($device_id, $user_id) {
        return UserPlatform::where('device_id', $device_id)
                        ->where('user_id', $user_id)
                        ->update(['user_id' => 0, 'logoutdate' => date('Y-m-d H:i:s', time())]);
    }

    /**
     * 获取线上客户端最新版本信息
     *
     * 
     * @return string token
     */
    public function VersionList() {
        return AppVersion::get();
    }

    /**
     * 更新客户端版本信息
     * 
     * @param int $id app_version表主键
     * @param int $version_num 版本号
     * @param string $version 版本名
     * @param string $info 更新信息
     * @param string $url 更新地址
     * @param string $version_update 强制更新版本
     * 
     * @return string token
     */
    public function VersionUpdate($id, $version_num, $version, $info, $url, $version_update) {
        $appVersion = AppVersion::find($id);
        $appVersion->version_num = $version_num;
        $appVersion->version = $version;
        $appVersion->info = $info;
        $appVersion->url = $url;
        $appVersion->version_update = empty($version_update) ? "" : $version_update;

        return $appVersion->save();
    }

    /**
     * 私有方法，获取版本信息
     *
     * @param string $platform 平台
     * @param string  type 理财端'invest'，借款端'loan'
     * 
     * @return string token
     */
    private function getVersion($platform, $type) {
        $appVersion = AppVersion::where(['platform' => strtolower($platform), 'client' => $type])
                ->select('version_num', 'version', 'info', 'url', 'version_update')
                ->orderBy('created_at', 'desc')
                ->first();       

        return $appVersion;
    }

}
