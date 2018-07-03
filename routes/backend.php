<?php

/*
|--------------------------------------------------------------------------
| 钱进家网络借贷中介信息平台-运营管理系统接口
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//登陆接口
Route::middleware('vsign')->post('login', 'AccountController@login');
//注销接口
Route::middleware('vsign')->post('logout', 'AccountController@logout');


//权限设置
Route::group(['prefix' => 'sysaccount'], function () {
    //系统账号列表
    Route::middleware('vsign')->get('accounts', 'AccountController@accounts');
    //系统角色列表
    Route::middleware('vsign')->get('roles', 'AccountController@roles');
    //系统权限列表
    Route::middleware('vsign')->get('actions', 'AccountController@actions');
});

//账号
Route::group(['prefix' => 'account'], function () {
    //创建
    Route::middleware('vsign')->post('create', 'AccountController@createAccount');
    //更新
    Route::middleware('vsign')->post('update', 'AccountController@updateAccount');
    //删除
    Route::middleware('vsign')->post('delete', 'AccountController@deleteAccount');
    //恢复
    Route::middleware('vsign')->post('recover', 'AccountController@recoverAccount');
    //设置角色
    Route::middleware('vsign')->post('roles', 'AccountController@setAccountRoles');
});

//角色
Route::group(['prefix' => 'role'], function () {
    //创建
    Route::middleware('vsign')->post('create', 'AccountController@createRole');
    //删除
    Route::middleware('vsign')->post('delete', 'AccountController@deleteRole');
    //设置目录权限
    Route::middleware('vsign')->post('menus', 'AccountController@setRoleMenus');
});

//系统目录权限
Route::group(['prefix' => 'action'], function () {
    //创建系统目录权限
    Route::middleware('vsign')->post('create', 'AccountController@createAction');
    //删除权限
    Route::middleware('vsign')->post('delete', 'AccountController@deleteAction');
});

//系统设置-客户端版本升级设置
Route::group(['prefix' => 'app'], function() {
    //获取最新的线上客户端版本
    Route::middleware('vsign')->get('list', 'SystemController@version');
    //更新客户端版本信息
    Route::middleware('vsign')->post('edit', 'SystemController@versionUpdate');
});

//平台用户管理
Route::group(['prefix' => 'users'], function () {
    //产品列表
    Route::middleware('vsign')->get('list', 'UserController@users');
    //锁定用户帐号
    Route::middleware('vsign')->post('lock', 'UserController@lock');
    //解锁用户帐号
    Route::middleware('vsign')->post('unlock', 'UserController@unlock');
});

//借款管理
Route::group(['prefix' => 'loan'], function () {
    //借款申请列表
    Route::middleware('vsign')->get('list', 'LoanController@loan');
    //还款列表
    Route::middleware('vsign')->get('repayment', 'LoanController@repayment');
    //还款详情列表
    Route::middleware('vsign')->get('repayment/detail', 'LoanController@repayment_detail');
    //审核借款申请
    Route::middleware('vsign')->post('approve', 'LoanController@approve');
});

//标的管理
Route::group(['prefix' => 'project'], function () {
    //标的列表
    Route::middleware('vsign')->get('list', 'ProjectController@project');
    //生成标的
    Route::middleware('vsign')->post('edit', 'ProjectController@edit');
    //满标审核通过
    Route::middleware('vsign')->post('pass', 'ProjectController@pass');
    //合标
    Route::middleware('vsign')->post('merge', 'ProjectController@project_merge');
    //合标列表
    Route::middleware('vsign')->get('merge_list', 'ProjectController@merge_list');
});

//红包管理
Route::group(['prefix' => 'redpacket'], function () {
    //红包列表
    Route::middleware('vsign')->get('list', 'RedPacketController@redpacket_list');
    //发送红包
    Route::middleware('vsign')->post('send', 'RedPacketController@send_redpacket_to_lender');
    //出借人列表
    Route::middleware('vsign')->get('lender_list', 'RedPacketController@lender_list');

});

//出借人订单管理
Route::group(['prefix' => 'order'], function () {
    //红包列表
    Route::middleware('vsign')->get('invest_list', 'LenderController@get_invest_list');
    //提现申请列表
    Route::middleware('vsign')->get('with_draw_list', 'LenderController@with_draw_list');
    //提现审核
    Route::middleware('vsign')->post('with_draw_pass', 'LenderController@with_draw_pass');
    //提现审核列表导出
    Route::middleware('vsign')->get('with_draw_export', 'LenderController@with_draw_export');


});


//内容管理
Route::group(['prefix' => 'content'], function () {
    //banner列表
    Route::middleware('vsign')->get('banner/list', 'ContentController@banners');
    //添加banner
    Route::middleware('vsign')->post('banner/add', 'ContentController@addBanner');
    //编辑banner
    Route::middleware('vsign')->post('banner/edit', 'ContentController@editBanner');
    //删除banner
    Route::middleware('vsign')->post('banner/delete', 'ContentController@deleteBanner');

});

//理财管理
Route::group(['prefix' => 'financing'], function () {
    //债权转让列表
    Route::middleware('vsign')->get('debtList','FinancingController@debtList');
    //单条债权转让历史记录
    Route::middleware('vsign')->get('debtList/debtRecord','FinancingController@debtRecord');
});
