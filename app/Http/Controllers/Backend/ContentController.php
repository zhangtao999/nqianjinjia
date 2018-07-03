<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Service\Backend\ContentService;

/**
 * Banner 和 新闻管理
 *
 * @author mashouchao
 */
class ContentController extends Controller {

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Request $request) {
        parent::__construct($request);
    }

    /**
     * Banner 列表
     *
     * @SWG\Get(
     *   path="/backend/content/banner/list",
     *   tags={"【Backend】运营管理系统"},
     *   summary="Banner 列表",
     *   description="Banner 列表",
     *   operationId="banners",
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
    public function banners(Request $request) {
        //当前页码
        $page = empty($request->get('page')) ? 1 : $request->get('page');
        //每页条数
        $pageSize = empty($request->get('pageSize')) ? 10 : $request->get('pageSize');

        $contentService = new ContentService();

        parent::success($contentService->BannersList($page, $pageSize));
    }

    /**
     * 添加 banner
     *
     * @SWG\Post(
     *   path="/backend/content/banner/add",
     *   tags={"【Backend】运营管理系统"},
     *   summary="添加 banner",
     *   description="添加 banner",
     *   operationId="addBanner",
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
     *              property="type",
     *              type="integer",     
     *          ),
     *          @SWG\Property(
     *              property="url",
     *              type="string",     
     *          ),
     *          @SWG\Property(
     *              property="href",
     *              type="string",     
     *          ),
     *      )
     *   ), 
     *   @SWG\Response(response=200, description="操作成功")
     * )
     */
    public function addBanner(Request $request) {
        $params = array();
        //位置
        $params['type'] = $request->json('type');
        //图片地址
        $params['url'] = $request->json('url');
        //外链地址
        $params['href'] = $request->json('href');

        $contentService = new ContentService();

        if ($contentService->BannersAdd($params)) {
            parent::success($contentService->BannersList(1, 20), "创建成功");
        } else {
            parent::failed("创建失败", config('system.bkcode.create_error'));
        }
    }

    /**
     * 编辑 banner
     *
     * @SWG\Post(
     *   path="/backend/content/banner/edit",
     *   tags={"【Backend】运营管理系统"},
     *   summary="编辑 banner",
     *   description="编辑 banner",
     *   operationId="editBanner",
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
     *              property="type",
     *              type="integer",     
     *          ),
     *          @SWG\Property(
     *              property="url",
     *              type="string",     
     *          ),
     *          @SWG\Property(
     *              property="href",
     *              type="string",     
     *          ),
     *      )
     *   ), 
     *   @SWG\Response(response=200, description="操作成功")
     * )
     */
    public function editBanner(Request $request) {
        $params = array();
        $params['id'] = $request->json('id');
        //位置
        $params['type'] = $request->json('type');
        //图片地址
        $params['url'] = $request->json('url');
        //外链地址
        $params['href'] = $request->json('href');

        $contentService = new ContentService();

        if ($contentService->BannersEdit($params)) {
            parent::success($contentService->BannersList(1, 20), "编辑成功");
        } else {
            parent::failed("编辑失败", config('system.bkcode.edit_error'));
        }
    }

    /**
     * 删除 banner
     *
     * @SWG\Post(
     *   path="/backend/content/banner/delete",
     *   tags={"【Backend】运营管理系统"},
     *   summary="删除 banner",
     *   description="删除 banner",
     *   operationId="deleteBanner",
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
    public function deleteBanner(Request $request) {
        $id = $request->json('id');

        $contentService = new ContentService();

        if ($contentService->BannersDelete($id)) {
            parent::success($contentService->BannersList(1, 20), "删除成功");
        } else {
            parent::failed(config('system.bkcode.delete_error'));
        }
    }

}
