<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Service\Backend;

use App\Model\Banner;

/**
 * Banner 和 新闻管理
 *
 * @author mashouchao
 */
class ContentService
{

    //状态
    const STATUS_NORMAL = 1;
    const STATUS_DELETE = -1;

    /**
     * Banner列表
     *
     * @param int $page 当前页码
     * @param int $pageSize  每页条数
     * 
     * @return string token
     */
    public function BannersList($page, $pageSize)
    {

        $datas['list'] = Banner::skip(($page - 1) * $pageSize)->orderBy('id', 'desc')->take($pageSize)->get();

        $total = Banner::count();

        $datas['page'] = ["total" => $total, "current" => $page, "pageSize" => $pageSize];

        return $datas;
    }

    /**
     * 添加banner
     *
     * @param array $params 参数
     * 
     * @return string token
     */
    public function BannersAdd($params)
    {
        $banner = new Banner();
        $banner->type = $params['type'];
        $banner->url = $params['url'];
        $banner->href = $params['href'];

        return $banner->save();
    }

    /**
     * 编辑banner
     *
     * @param array $params 参数
     * 
     * @return string token
     */
    public function BannersEdit($params)
    {
        $banner = Banner::find($params['id']);
        $banner->type = $params['type'];
        $banner->url = $params['url'];
        $banner->href = $params['href'];

        return $banner->save();
    }

    /**
     * 删除banner
     *
     * @param int $id 主键
     * 
     * @return string token
     */
    public function BannersDelete($id)
    {
        $banner = Banner::find($id);

        $banner->status = self::STATUS_DELETE;

        return $banner->save();
    }

}
