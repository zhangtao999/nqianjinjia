<?php

/*
 *
 */

namespace App\Service\Backend;

use App\Model\Users;
use App\Model\Borrower;
use App\Model\Lender;
use App\Model\Authentic;
use App\Model\UserAccountSafe;
use Illuminate\Support\Facades\Log;

/**
 * 用户管理服务，包括投资人/借款人
 *
 * @author mashouchao
 */
class UserService {

    /**
     * 获取所有用户列表
     *
     * @param int $page 当前页码
     * @param int $pageSize 每页条数
     * @param string $field 查询字段
     * @param string $keyword 查询字段的值
     *
     * @return string token
     */
    public function UsersList($page, $pageSize, $field = "", $keyword = "") {
        Log::info(__FUNCTION__.__LINE__. "userlist:",[$page, $pageSize, $field, $keyword]);
        $total = 0;
        if (empty($keyword)) {
            $mdb=Authentic::rightJoin('users','users.id','authentic.uid')
                ->select('authentic.full_name','users.id',  'users.mobile','users.created_at');

            $total = $mdb->count();
            $datas['list'] =$mdb->skip(($page - 1) * $pageSize)->take($pageSize)->get();
        } else {
            $mdb=Users::leftJoin('authentic','authentic.uid','users.id')
                ->select('authentic.full_name','users.id',  'users.mobile','users.created_at')
                ->where($field, 'like', "%{$keyword}%");

            $total = $mdb->count(); //Users::where($field, 'like', "%{$keyword}%")->count();
            $datas['list'] =$mdb->skip(($page - 1) * $pageSize)->take($pageSize)->get();

        }

        foreach ($datas['list'] as $k => $v) {
            //借款人信息
            $datas['list'][$k]['borrower'] = Borrower::where('uid', $v['id'])->first();
            //投资人信息
            $datas['list'][$k]['lender'] = Lender::where('uid', $v['id'])->first();
            //注册用户实名认证的基础信息
            $datas['list'][$k]['base'] = Authentic::where('uid', $v['id'])->first();
            //账号锁定状态
            $datas['list'][$k]['login_status'] = UserAccountSafe::where('uid', $v['id'])->first();
        }

        $datas['page'] = ["total" => $total, "current" => $page, "pageSize" => $pageSize];

        return $datas;
    }

    /**
     * 锁定用户帐号
     *
     * @param int $uid 当前用户编号
     *
     * @return string token
     */
    public function UsersLock($uid) {
        //1 正常，2锁定
        return UserAccountSafe::where('uid', $uid)->update(['login_status' => 2]);
    }

    /**
     * 解锁用户帐号
     *
     * @param int $uid 当前用户编号
     *
     * @return string token
     */
    public function UsersUnLock($uid) {
        //1 正常，2锁定
        return UserAccountSafe::where('uid', $uid)->update(['login_status' => 1]);
    }

}
