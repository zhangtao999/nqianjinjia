<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Service\Backend\UserService;

/**
 * 用户管理控制器，包括投资人/借款人
 *
 * @author mashouchao
 */
class UserController extends Controller {

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Request $request) {
        parent::__construct($request);
    }

    /**
     * 获取平台用户列表
     *
     * @SWG\Get(
     *   path="/backend/users/list",
     *   tags={"【Backend】运营管理系统"},
     *   summary="获取平台用户列表",
     *   description="获取平台用户列表",
     *   operationId="users",
     *   produces={"application/json"},
     *   schemes ={"http"},
     *   @SWG\Parameter(in="header", name="X-QJJ-Sign", type="string",default="qianjinjia", required=true),
     *   @SWG\Parameter(in="query", name="page", type="integer",default=1, description="页码", required=true),
     *   @SWG\Parameter(in="query", name="pageSize", type="integer",default=10, description="每页返回数量", required=false),
     *   @SWG\Parameter(in="query", name="field", type="string", description="查询字段", required=false),
     *   @SWG\Parameter(in="query", name="keyword", type="string", description="查询字段的值", required=false),
     *   @SWG\Response(response=200, description="操作成功"),
     *   @SWG\Response(response=401, description="权限被拒绝"),
     * )
     */
    public function users(Request $request) {
        //当前页码
        $page = empty($request->get('page')) ? 1 : (int) $request->get('page');
        //每页条数
        $pageSize = empty($request->get('pageSize')) ? 10 : (int) $request->get('pageSize');
        //查询字段
        $field = empty($request->get('field')) ? '' : $request->get('field');
        //查询字段的值
        $keyword = empty($request->get('keyword')) ? '' : $request->get('keyword');

        $usersService = new UserService();

        parent::success($usersService->UsersList($page, $pageSize, $field, $keyword));
    }

    /**
     * 锁定用户帐号
     *
     * @SWG\Post(
     *   path="/backend/users/lock",
     *   tags={"【Backend】运营管理系统"},
     *   summary="锁定用户帐号",
     *   description="锁定用户帐号",
     *   operationId="lock",
     *   produces={"application/json"},
     *   schemes ={"http"},
     *   @SWG\Parameter(in="header", name="X-QJJ-Sign", type="string",default="qianjinjia", required=true),
     *   @SWG\Parameter(
     *     in="body",
     *     name="body",
     *     description="参数",
     *     required=true,
     *     @SWG\Schema(
     *          @SWG\Property(
     *              property="id",
     *              type="integer",
     *          ),
     *      )
     *   ),
     *   @SWG\Response(response=200, description="操作成功")
     * )
     */
    public function lock(Request $request) {
        $uid = $request->json("id");

        $usersService = new UserService();
        if ($usersService->UsersLock($uid)) {
            parent::success($usersService->UsersList(1, 10), '锁定成功');
        } else {
            parent::failed("锁定失败", config('system.bkcode.lock_failed'));
        }
    }

    /**
     * 解锁用户帐号
     *
     * @SWG\Post(
     *   path="/backend/users/unlock",
     *   tags={"【Backend】运营管理系统"},
     *   summary="解锁用户帐号",
     *   description="解锁用户帐号",
     *   operationId="unlock",
     *   produces={"application/json"},
     *   schemes ={"http"},
     *   @SWG\Parameter(in="header", name="X-QJJ-Sign", type="string",default="qianjinjia", required=true),
     *   @SWG\Parameter(
     *     in="body",
     *     name="body",
     *     description="参数",
     *     required=true,
     *     @SWG\Schema(
     *          @SWG\Property(
     *              property="id",
     *              type="integer",
     *          ),
     *      )
     *   ),
     *   @SWG\Response(response=200, description="操作成功")
     * )
     */
    public function unlock(Request $request) {
        $uid = $request->json("id");

        $usersService = new UserService();
        if ($usersService->UsersUnLock($uid)) {
            parent::success($usersService->UsersList(1, 10), '解锁成功');
        } else {
            parent::failed("解锁失败", config('system.bkcode.unlock_failed'));
        }
    }

}
