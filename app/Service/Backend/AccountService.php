<?php

/*
 * 后台管理系统账号、角色、权限设置逻辑
 */

namespace App\Service\Backend;

use App\Model\Admin;
use App\Model\AdminRole;
use App\Model\AdminAction;
use Illuminate\Support\Facades\DB;

/**
 * 后台管理系统账号、角色、权限设置逻辑
 *
 * @author mashouchao
 */
class AccountService {

    //账号状态
    const STATUS_NORMAL = 1;
    const STATUS_DELETE = -1;

    /**
     * 获取所有账户信息
     *
     * @param int $page 当前页码
     * @param int $pageSize 每页条数
     * @param string $field 查询字段
     * @param string $keyword 查询字段的值
     * 
     * @return string token
     */
    public function AccountsList($page, $pageSize, $field = "", $keyword = "") {
        $total = 0;

        if (empty($keyword)) {
            $datas['list'] = Admin::skip(($page - 1) * $pageSize)->take($pageSize)->get();
            $total = Admin::count();
        } else {
            $datas['list'] = Admin::where($field, 'like', "%{$keyword}%")->skip(($page - 1) * $pageSize)->take($pageSize)->get();
            $total = Admin::where($field, 'like', "%{$keyword}%")->count();
        }

        foreach ($datas['list'] as $k => $v) {
            $datas['list'][$k]['own_roles'] = $this->RolesForAdmin($v['id']);
            $datas['list'][$k]['roles'] = $this->GetRoles();
        }

        $datas['page'] = ["total" => $total, "current" => $page, "pageSize" => $pageSize];

        return $datas;
    }

    /**
     * 获取所有角色列表
     *
     * @param int $page 当前页码
     * @param int $pageSize 每页条数
     * 
     * @return string token
     */
    public function RolesList($page, $pageSize) {
        $datas['list'] = AdminRole::where('status', self::STATUS_NORMAL)->skip(($page - 1) * $pageSize)->take($pageSize)->get();

        foreach ($datas['list'] as $k => $v) {
            //所有的目录
            $datas['list'][$k]['menus'] = $this->GetMenus(true);

            //角色已经拥有的目录
            $datas['list'][$k]['own_menus'] = $this->ActionsForMenus($v['id']);
        }
        $datas['page'] = ["total" => AdminRole::where('status', self::STATUS_NORMAL)->count(), "current" => $page, "pageSize" => $pageSize];

        return $datas;
    }

    /**
     * 获取账户对应的角色列表
     *
     * @param int $admin_id 账户编号
     * 
     * @return string token
     */
    public function RolesForAdmin($admin_id = 0) {
        return $this->GetRoleByAdminId($admin_id);
    }

    /**
     * 获取所有 action
     *
     * @param int $page 当前页码
     * @param int $pageSize 每页条数
     * 
     * @return string token
     */
    public function ActionsList($page, $pageSize) {
        $actionList = AdminAction::where('status', self::STATUS_NORMAL)->skip(($page - 1) * $pageSize)->take($pageSize)->get();

        $datas['list'] = $actionList;

        $datas['page'] = ["total" => AdminAction::where('status', self::STATUS_NORMAL)->count(), "current" => $page, "pageSize" => $pageSize];

        return $datas;
    }

    /**
     * 获取角色对应的目录 
     *
     * @param int $role_id 角色编号
     * 
     * @return string token
     */
    public function ActionsForMenus($role_id = 0) {
        return $this->GetMenusByRoleId($role_id);
    }

    /**
     * 创建账户
     *
     * @param string $username  用户名
     * @param string $password  密码
     * @param string $real_name 真实姓名
     * 
     * @return string token
     */
    public function CreateAccount($username, $password, $real_name) {
        $admin = new Admin;
        $admin->username = $username;
        $admin->password = md5($password);
        $admin->real_name = $real_name;

        return $admin->save();
    }

    /**
     * 更新账户
     *
     * @param int $admin_id 账号编号
     * @param string $username  用户名
     * @param string $password  密码
     * @param string $real_name 真实姓名
     * 
     * @return string token
     */
    public function UpdateAccount($admin_id, $username, $password, $real_name) {
        $admin = Admin::find($admin_id);
        $admin->username = $username;
        if (!empty($password)) {
            $admin->password = md5($password);
        }
        $admin->real_name = $real_name;

        return $admin->save();
    }

    /**
     * 删除账户
     *
     * @param int $admin_id 编号
     * 
     * @return string token
     */
    public function DeleteAccount($admin_id) {
        $admin = Admin::find($admin_id);
        $admin->status = self::STATUS_DELETE;

        return $admin->save();
    }

    /**
     * 恢复账户
     *
     * @param int $admin_id 编号
     * 
     * @return string token
     */
    public function RecoverAccount($admin_id) {
        $admin = Admin::find($admin_id);
        $admin->status = self::STATUS_NORMAL;

        return $admin->save();
    }

    /**
     * 设置账号的角色
     *
     * @param int $admin_id 编号
     * @param string $roles 角色编号，以逗号隔开
     * 
     * @return string token
     */
    public function SetAccountRoles($admin_id, $roles) {

        if (empty($roles)) {
            //清除所有的角色
            DB::update('update relation_admin_role set status = -1 where admin_id = ? ', [$admin_id]);

            return true;
        }

        $arrayRoles = explode(',', $roles);

        //清除取消的角色
        DB::table('relation_admin_role')->where('admin_id', '=', $admin_id)->whereNotIn('role_id', $arrayRoles)->update(['status' => self::STATUS_DELETE]);

        //增加新的角色
        foreach ($arrayRoles as $v) {
            //新增角色
            if (!DB::table('relation_admin_role')->where([['admin_id', '=', $admin_id], ['role_id', '=', $v]])->count()) {
                DB::table('relation_admin_role')->insert([
                    'admin_id' => $admin_id,
                    'role_id' => $v
                ]);
            }
            //取消的角色重新启用
            $count = DB::table('relation_admin_role')->where('status', '=', self::STATUS_DELETE)->where('admin_id', '=', $admin_id)->where('role_id', '=', $v)->count();

            if ($count > 0) {
                DB::table('relation_admin_role')->where([
                    ['admin_id', '=', $admin_id],
                    ['role_id', '=', $v],
                    ['status', '=', self::STATUS_DELETE]
                ])->update(['status' => self::STATUS_NORMAL]);
            }
        }

        return true;
    }

    /**
     * 给角色设置目录权限
     *
     * @param int $role_id 角色编号
     * @param string $menus 目录，以逗号隔开
     * 
     * @return string token
     */
    public function SetRoleMenus($role_id, $menus) {
        if (DB::table('relation_role_menu')->where('role_id', '=', $role_id)->count()) {

            DB::table('relation_role_menu')->where('role_id', $role_id)
                    ->update(['menus' => $menus, 'status' => self::STATUS_NORMAL]);
        } else {
            DB::table('relation_role_menu')->insert([
                'role_id' => $role_id,
                'menus' => $menus
            ]);
        }

        return true;
    }

    /**
     * 创建角色
     *
     * @param string $role_name 角色名称
     * 
     * @return string token
     */
    public function CreateRole($role_name) {
        $role = new AdminRole;
        $role->role_name = $role_name;

        return $role->save();
    }

    /**
     * 删除角色
     *
     * @param int $role_id 角色编号
     * 
     * @return string token
     */
    public function DeleteRole($role_id) {
        $role = AdminRole::find($role_id);
        $role->status = self::STATUS_DELETE;

        return $role->save();
    }

    /**
     * 创建目录权限
     *
     * @param int $parent_id   父编号
     * @param string $action_name  目录／操作名词
     * @param string $type   权限类型 目录／操作
     * 
     * @return string token
     */
    public function CreateAction($parent_id, $action_name, $type) {
        $action = new AdminAction;
        $action->action_name = $action_name;
        $action->parent_id = $parent_id;
        $action->type = $type;

        return $action->save();
    }

    /**
     * 删除目录权限
     * 
     * @param int $action_id    目录／操作编号
     *
     * @return string token
     */
    public function DeleteAction($action_id) {
        $action = AdminAction::find($action_id);
        $action->status = self::STATUS_DELETE;

        return $action->save();
    }

    /**
     * 登陆
     * 
     * @param string $username 用户名
     * @param string $password 密码
     * 
     * @return string token
     */
    public function Login($username, $password) {
        $admin = Admin::where([['status', self::STATUS_NORMAL], ['username', $username]])->first();

        if (empty($admin) || $admin->password !== md5($password)) {
            return null;
        }

        //获取有权限的目录，系统管理员编号为1，拥有所有权限
        $menus_ids = $this->GetMenusIds($admin->id);
        $admin['menus'] = $this->GetMenus($admin->id === 1 ? true : false, $menus_ids);
        $admin['token'] = md5(config('system.backend-key').$admin->username.$admin->password);

        return $admin;
    }

    /**
     * 获取账户拥有的目录权限 
     *
     * @param int $admin_id 账户编号
     * 
     * @return array
     */
    private function GetMenusIds($admin_id) {

        $sql = <<<SQL
            SELECT menus 
            FROM relation_role_menu
            WHERE status = 1 
            AND role_id IN (SELECT role_id FROM relation_admin_role WHERE admin_id = {$admin_id} AND status=1)
SQL;

        $menusList = DB::select($sql);

        $menus = "";
        foreach ($menusList as $v) {
            $menus .= $v->menus . ',';
        }

        return explode(',', rtrim($menus, ','));
    }

    /**
     * 获取角色对应的所有 action
     *
     * @param int $role_id 角色编号
     * 
     * @return array
     */
    private function GetMenusByRoleId($role_id) {
        $menus = DB::table('relation_role_menu')->where([['status', self::STATUS_NORMAL], ['role_id', $role_id]])->value('menus');

        return explode(',', $menus);
    }

    /**
     * 获取树形结构目录
     *
     * @param bool $isAll 是否获取所有的目录
     * @param array $menus_ids 用户拥有的目录 
     * 
     * @return array
     */
    private function GetMenus($isAll, $menus_ids = []) {
        $menusList = AdminAction::where([['status', self::STATUS_NORMAL], ['type', 'menu']])->get();

        //树形结构菜单
        $menus = [];

        foreach ($menusList as $v) {
            if ($v['parent_id'] == 0) {
                $children = self::GetSecondMenus($menusList, $v['id'], $isAll, $menus_ids);
                if (!empty($children)) {
                    $menus[] = ['id' => $v['id'], 'name' => $v['action_name'], 'key' => $v['key'], 'icon' => $v['icon'], 'child' => $children];
                } else {
                    if ($isAll || in_array($v['id'], $menus_ids)) {
                        $menus[] = ['id' => $v['id'], 'name' => $v['action_name'], 'key' => $v['key'], 'icon' => $v['icon']];
                    }
                }
            }
        }

        return $menus;
    }

    /**
     * 获取二级以下目录
     *
     * @param array $menus 主菜单目录
     * @param int $id 父菜单目录编号 
     * @param bool $isAll 是否获取所有的目录
     * @param array $menus_ids 用户拥有的目录 
     * 
     * @return array
     */
    private function GetSecondMenus($menus, $id, $isAll, $menus_ids) {
        $menus_children = [];
        foreach ($menus as $v) {
            if ($v['parent_id'] == $id) {
                $children = self::GetSecondMenus($menus, $v['id'], $isAll, $menus_ids);
                if (!empty($children)) {
                    $menus_children[] = ['id' => $v['id'], 'name' => $v['action_name'], 'key' => $v['key'], 'icon' => $v['icon'], 'child' => $children];
                } else {
                    if ($isAll || in_array($v['id'], $menus_ids)) {
                        $menus_children[] = ['id' => $v['id'], 'name' => $v['action_name'], 'key' => $v['key'], 'icon' => $v['icon']];
                    }
                }
            }
        }

        return $menus_children;
    }

    /**
     * 获取账户对应的角色列表 
     *
     * @param int $admin_id 账户编号
     * 
     * @return array
     */
    private function GetRoleByAdminId($admin_id) {
        $ownRoles = DB::table('admin_role')
                ->join('relation_admin_role', 'relation_admin_role.role_id', '=', 'admin_role.id')
                ->where([['relation_admin_role.admin_id', '=', $admin_id], ['relation_admin_role.status', '=', self::STATUS_NORMAL],])
                ->select('admin_role.id')
                ->get();

        $arrayRoles = [];

        foreach ($ownRoles as $v) {
            $arrayRoles[] = get_object_vars($v)['id'];
        }

        return $arrayRoles;
    }

    /**
     * 获取所有角色待选列表 
     *
     * @param int $admin_id 账户编号
     * 
     * @return array
     */
    private function GetRoles() {

        $sql = <<<SQL
            SELECT admin_role.id value, admin_role.role_name label,admin_role.created_at 
            FROM admin_role 
SQL;

        $roleList = DB::select($sql);

        return $roleList;
    }

}
