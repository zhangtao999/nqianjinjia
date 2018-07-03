<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Service\LogService;

/**
 * APP 版本控制
 *
 * @author mashouchao
 */
class SystemController extends Controller {

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Request $request) {
        parent::__construct($request);
    }

    /**
     * APP 端版本列表
     *
     * @SWG\Get(
     *   path="/backend/app/list",
     *   tags={"【Backend】运营管理系统"},
     *   summary="获取APP版本列表",
     *   description="获取APP版本列表",
     *   operationId="version",
     *   produces={"application/json"},
     *   schemes ={"http"}, 
     *   @SWG\Parameter(in="header", name="X-QJJ-Sign", type="string",default="qianjinjia", required=true), 
     *   @SWG\Response(response=200, description="操作成功"),
     *   @SWG\Response(response=401, description="权限被拒绝"),
     * )
     */
    public function version() {
        $logService = new LogService();

        parent::success($logService->VersionList());
    }

    /**
     * 编辑客户端版本信息
     *
     * @SWG\Post(
     *   path="/backend/app/edit",
     *   tags={"【Backend】运营管理系统"},
     *   summary="编辑客户端版本信息",
     *   description="编辑客户端版本信息",
     *   operationId="versionUpdate",
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
     *              property="version_num", 
     *              type="integer",     
     *          ),
     *          @SWG\Property(
     *              property="version", 
     *              type="string",     
     *          ),
     *          @SWG\Property(
     *              property="info", 
     *              type="string",     
     *          ),
     *          @SWG\Property(
     *              property="url", 
     *              type="string",     
     *          ),
     *          @SWG\Property(
     *              property="version_update", 
     *              type="string",     
     *          ),
     *      )
     *   ), 
     *   @SWG\Response(response=200, description="操作成功")
     * )
     */
    public function versionUpdate(Request $request) {
        $id = $request->json('id');
        $version_num = $request->json('version_num');
        $version = $request->json('version');
        $info = $request->json('info');
        $url = $request->json('url');
        $version_update = $request->json('version_update');

        $logService = new LogService();

        if ($logService->VersionUpdate($id, $version_num, $version, $info, $url, $version_update)) {
            parent::success($logService->VersionList(), '编辑成功');
        } else {
            parent::failed("编辑失败", config('system.bkcode.edit_error'));
        }
    }

}
