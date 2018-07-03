<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Service\Backend\AccountService;

class AccountController extends Controller {

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Request $request) {
        parent::__construct($request);
    }

    /**
     * 获取系统账号列表
     *
     * @SWG\Get(
     *   path="/backend/sysaccount/accounts",
     *   tags={"【Backend】运营管理系统"},
     *   summary="获取系统管理员列表",
     *   description="获取系统管理员列表",
     *   operationId="accounts",
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
    public function accounts(Request $request) {
        //当前页码
        $page = empty($request->get('page')) ? 1 : $request->get('page');
        //每页条数
        $pageSize = empty($request->get('pageSize')) ? 10 : $request->get('pageSize');
        //查询字段
        $field = empty($request->get('field')) ? '' : $request->get('field');
        //查询字段的值
        $keyword = empty($request->get('keyword')) ? '' : $request->get('keyword');

        $accountService = new AccountService();

        parent::success($accountService->AccountsList($page, $pageSize, $field, $keyword));
    }

    /**
     * 系统账号角色列表
     *
     * @SWG\Get(
     *   path="/backend/sysaccount/roles",
     *   tags={"【Backend】运营管理系统"},
     *   summary="获取系统角色列表",
     *   description="获取系统角色列表",
     *   operationId="roles",
     *   produces={"application/json"},
     *   schemes ={"http"},
     *   @SWG\Parameter(in="header", name="X-QJJ-Sign", type="string",default="qianjinjia", required=true),
     *   @SWG\Parameter(in="query", name="page", type="integer",default=1, description="页码", required=true),
     *   @SWG\Parameter(in="query", name="pageSize", type="integer",default=10, description="每页返回数量", required=false),
     *   @SWG\Response(response=200, description="操作成功"),
     *   @SWG\Response(response=401, description="权限被拒绝"),
     * )
     */
    public function roles(Request $request) {
        //当前页码
        $page = empty($request->get('page')) ? 1 : $request->get('page');
        //每页条数
        $pageSize = empty($request->get('pageSize')) ? 10 : $request->get('pageSize');

        $accountService = new AccountService();

        parent::success($accountService->RolesList($page, $pageSize));
    }

    /**
     * 系统权限动作列表
     *
     * @SWG\Get(
     *   path="/backend/sysaccount/actions",
     *   tags={"【Backend】运营管理系统"},
     *   summary="获取系统权限动作列表",
     *   description="获取系统权限动作列表",
     *   operationId="actions",
     *   produces={"application/json"},
     *   schemes ={"http"},
     *   @SWG\Parameter(in="header", name="X-QJJ-Sign", type="string",default="qianjinjia", required=true),
     *   @SWG\Parameter(in="query", name="page", type="integer",default=1, description="页码", required=true),
     *   @SWG\Parameter(in="query", name="pageSize", type="integer",default=10, description="每页返回数量", required=false),
     *   @SWG\Response(response=200, description="操作成功"),
     *   @SWG\Response(response=401, description="权限被拒绝"),
     * )
     */
    public function actions(Request $request) {
        ///当前页码
        $page = empty($request->get('page')) ? 1 : $request->get('page');
        //每页条数
        $pageSize = empty($request->get('pageSize')) ? 10 : $request->get('pageSize');

        $accountService = new AccountService();

        parent::success($accountService->ActionsList($page, $pageSize));
    }

    /**
     * 创建系统账号
     *
     * @SWG\Post(
     *   path="/backend/account/create",
     *   tags={"【Backend】运营管理系统"},
     *   summary="创建系统账号",
     *   description="新增一个系统账号",
     *   operationId="createAccount",
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
     *              property="username",
     *              type="string",
     *          ),
     *          @SWG\Property(
     *              property="password",
     *              type="string",
     *          ),
     *          @SWG\Property(
     *              property="real_name",
     *              type="string",
     *          ),
     *      )
     *   ),
     *   @SWG\Response(response=200, description="操作成功")
     * )
     */
    public function createAccount(Request $request) {
        $username = $request->json('username');
        $password = $request->json('password');
        $real_name = $request->json('real_name');

        $accountService = new AccountService();

        if ($accountService->CreateAccount($username, $password, $real_name)) {
            parent::success($accountService->AccountsList(1, 10));
        } else {
            parent::failed('创建失败', config('system.bkcode.create_error'));
        }
    }

    /**
     * 更新系统账号
     *
     * @SWG\Post(
     *   path="/backend/account/update",
     *   tags={"【Backend】运营管理系统"},
     *   summary="更新系统账号",
     *   description="更新一个系统账号",
     *   operationId="updateAccount",
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
     *          @SWG\Property(
     *              property="username",
     *              type="string",
     *          ),
     *          @SWG\Property(
     *              property="password",
     *              type="string",
     *          ),
     *          @SWG\Property(
     *              property="real_name",
     *              type="string",
     *          ),
     *      )
     *   ),
     *   @SWG\Response(response=200, description="操作成功")
     * )
     */
    public function updateAccount(Request $request) {
        $admin_id = $request->json('id');
        if($admin_id==1){   //admin密码不能线上改动
            parent::failed('can not edit admin password.', config('system.bkcode.edit_error'));
        }
        $username = $request->json('username');
        $password = $request->json('password');
        $real_name = $request->json('real_name');

        $accountService = new AccountService();

        if ($accountService->UpdateAccount($admin_id, $username, $password, $real_name)) {
            parent::success($accountService->AccountsList(1, 10));
        } else {
            parent::failed('编辑失败', config('system.bkcode.edit_error'));
        }
    }

    /**
     * 删除系统账号
     *
     * @SWG\Post(
     *   path="/backend/account/delete",
     *   tags={"【Backend】运营管理系统"},
     *   summary="删除系统账号",
     *   description="删除一个系统账号",
     *   operationId="deleteAccount",
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
     *          )
     *      )
     *   ),
     *   @SWG\Response(response=200, description="操作成功")
     * )
     */
    public function deleteAccount(Request $request) {
        $admin_id = $request->json('id');

        $accountService = new AccountService();

        if ($accountService->DeleteAccount($admin_id)) {
            parent::success($accountService->AccountsList(1, 10));
        } else {
            parent::failed('删除失败', config('system.bkcode.delete_error'));
        }
    }

    /**
     * 恢复系统账号
     *
     * @SWG\Post(
     *   path="/backend/account/recover",
     *   tags={"【Backend】运营管理系统"},
     *   summary="恢复系统账号",
     *   description="恢复一个系统账号",
     *   operationId="recoverAccount",
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
     *          )
     *      )
     *   ),
     *   @SWG\Response(response=200, description="操作成功")
     * )
     */
    public function recoverAccount(Request $request) {
        $admin_id = $request->json('id');

        $accountService = new AccountService();

        if ($accountService->RecoverAccount($admin_id)) {
            parent::success($accountService->AccountsList(1, 10));
        } else {
            parent::failed('恢复失败', config('system.bkcode.recover_error'));
        }
    }

    /**
     * 创建系统角色
     *
     * @SWG\Post(
     *   path="/backend/role/create",
     *   tags={"【Backend】运营管理系统"},
     *   summary="创建系统角色",
     *   description="新增一个系统角色",
     *   operationId="createRole",
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
     *              property="role_name",
     *              type="string",
     *          ),
     *      )
     *   ),
     *   @SWG\Response(response=200, description="操作成功")
     * )
     */
    public function createRole(Request $request) {
        $role_name = $request->json('role_name');

        $accountService = new AccountService();

        if ($accountService->CreateRole($role_name)) {
            parent::success(null, '创建成功');
        } else {
            parent::failed('创建失败', config('system.bkcode.create_error'));
        }
    }

    /**
     * 删除系统角色
     *
     * @SWG\Post(
     *   path="/backend/role/delete",
     *   tags={"【Backend】运营管理系统"},
     *   summary="删除系统角色",
     *   description="删除一个系统角色",
     *   operationId="deleteRole",
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
    public function deleteRole(Request $request) {
        $role_id = $request->json('id');

        $accountService = new AccountService();

        if ($accountService->DeleteRole($role_id)) {
            parent::success($accountService->RolesList(1, 10));
        } else {
            parent::failed('删除失败', config('system.bkcode.delete_error'));
        }
    }

    /**
     * 创建系统目录权限
     *
     * @SWG\Post(
     *   path="/backend/action/create",
     *   tags={"【Backend】运营管理系统"},
     *   summary="创建系统目录权限",
     *   description="新增系统目录权限",
     *   operationId="createAction",
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
     *              property="parent_id",
     *              type="integer",
     *          ),
     *          @SWG\Property(
     *              property="action_name",
     *              type="string",
     *          ),
     *          @SWG\Property(
     *              property="type",
     *              type="string",
     *          ),
     *      )
     *   ),
     *   @SWG\Response(response=200, description="操作成功")
     * )
     */
    public function createAction(Request $request) {
        $parent_id = $request->json('parent_id');
        $action_name = $request->json('action_name');
        $type = $request->json('type');

        $accountService = new AccountService();

        if ($accountService->CreateAction($parent_id, $action_name, $type)) {
            parent::success(null, '创建成功');
        } else {
            parent::failed('创建失败', config('system.bkcode.create_error'));
        }
    }

    /**
     * 删除系统目录权限
     *
     * @SWG\Post(
     *   path="/backend/action/delete",
     *   tags={"【Backend】运营管理系统"},
     *   summary="删除系统目录权限",
     *   description="删除系统目录权限",
     *   operationId="deleteAction",
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
    public function deleteAction(Request $request) {
        $action_id = $request->json('id');

        $accountService = new AccountService();

        if ($accountService->DeleteAction($action_id)) {
            parent::success($accountService->ActionsList(1, 10));
        } else {
            parent::failed('删除失败', config('system.bkcode.delete_error'));
        }
    }

    /**
     * 设置账号的角色
     *
     * @SWG\Post(
     *   path="/backend/account/roles",
     *   tags={"【Backend】运营管理系统"},
     *   summary="设置账号的角色",
     *   description="设置账号的角色",
     *   operationId="setAccountRoles",
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
     *          @SWG\Property(
     *              property="roles",
     *              type="string",
     *          ),
     *      )
     *   ),
     *   @SWG\Response(response=200, description="操作成功")
     * )
     */
    public function setAccountRoles(Request $request) {
        $admin_id = $request->json('id');

        $roles = $request->json('roles');

        $accountService = new AccountService();

        if ($accountService->SetAccountRoles($admin_id, rtrim($roles, ','))) {
            parent::success($accountService->AccountsList(1, 10));
        } else {
            parent::failed('设置失败', config('system.bkcode.set_error'));
        }
    }

    /**
     * 给角色设置目录权限
     *
     * @SWG\Post(
     *   path="/backend/role/menus",
     *   tags={"【Backend】运营管理系统"},
     *   summary="给角色设置目录权限",
     *   description="给角色设置目录权限",
     *   operationId="setRoleMenus",
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
     *          @SWG\Property(
     *              property="menus",
     *              type="string",
     *          ),
     *      )
     *   ),
     *   @SWG\Response(response=200, description="操作成功")
     * )
     */
    public function setRoleMenus(Request $request) {
        $role_id = $request->json('id');
        //字符串，以逗号隔开
        $menus = $request->json('menus');

        $accountService = new AccountService();

        if ($accountService->SetRoleMenus($role_id, rtrim($menus, ','))) {
            parent::success($accountService->RolesList(1, 10));
        } else {
            parent::failed('设置失败', config('system.bkcode.set_error'));
        }
    }

    /**
     * 账号登录
     *
     * @SWG\Post(
     *   path="/backend/login",
     *   tags={"【Backend】运营管理系统"},
     *   summary="登录",
     *   description="登录",
     *   operationId="login",
     *   produces={"application/json"},
     *   schemes ={"http"},
     *   @SWG\Parameter(in="header", name="X-QJJ-Sign", type="string",default="qianjinjia", required=true),
     *   @SWG\Parameter(
     *     in="body",
     *     name="body",
     *     description="登录参数",
     *     required=true,
     *     @SWG\Schema(
     *          @SWG\Property(
     *              property="username",
     *              type="string"
     *          ),
     *          @SWG\Property(
     *              property="password",
     *              type="string"
     *          )
     *      )
     *   ),
     *   @SWG\Response(response=200, description="登录成功"),
     * )
     */
    public function login(Request $request) {
        $username = $request->json('username');
        $password = $request->json('password');

        $accountService = new AccountService();

        $admin = $accountService->Login($username, $password);

        if ($admin) {
            parent::success($admin);
        } else {
            parent::failed("用户名密码错误", config("system.bkcode.login_error"));
        }
    }

    /**
     * 账号注销
     *
     * @SWG\Post(
     *   path="/backend/logout",
     *   tags={"【Backend】运营管理系统"},
     *   summary="账号注销",
     *   description="账号注销",
     *   operationId="logout",
     *   produces={"application/json"},
     *   schemes ={"http"},
     *   @SWG\Parameter(in="header", name="X-QJJ-Sign", type="string",default="qianjinjia", required=true),
     *   @SWG\Response(response=200, description="登录成功"),
     * )
     */
    public function logout() {
        if (true) {
            parent::success(null, '注销成功');
        } else {
            parent::failed("退出登录失败", config('system.bkcode.logout_error'));
        }
    }

}
