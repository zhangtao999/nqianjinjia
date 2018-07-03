<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Service\Backend\LoanService;

/**
 * 借款管理
 *
 * @author mashouchao
 */
class LoanController extends Controller {

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Request $request) {
        parent::__construct($request);
    }

    /**
     * 借款申请列表
     *
     * @SWG\Get(
     *   path="/backend/loan/list",
     *   tags={"【Backend】运营管理系统"},
     *   summary="借款申请列表",
     *   description="借款申请列表",
     *   operationId="loan",
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
    public function loan(Request $request) {
        //当前页码
        $page = $request->get('page',1) ;
        //每页条数
        $pageSize = $request->get('pageSize',10);
        //查询字段
        $field = $request->get('field','') ;
        //查询字段的值
        $keyword = $request->get('keyword','');

        $startTime= $request->get('startTime','');

        $endTime=  $request->get('endTime','');

        $loanService = new LoanService();

        return parent::success($loanService->LoanList($page, $pageSize, $field, $keyword,$startTime,$endTime),'',true);

    }

    /**
     * 还款列表
     *
     * @SWG\Get(
     *   path="/backend/loan/repayment",
     *   tags={"【Backend】运营管理系统"},
     *   summary="还款列表",
     *   description="还款列表",
     *   operationId="repayment",
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
    public function repayment(Request $request) {
        //当前页码
        $page = empty($request->get('page')) ? 1 : (int) $request->get('page');
        //每页条数
        $pageSize = empty($request->get('pageSize')) ? 10 : (int) $request->get('pageSize');
        //查询字段
        $field = empty($request->get('field')) ? '' : $request->get('field');
        //查询字段的值
        $keyword = empty($request->get('keyword')) ? '' : $request->get('keyword');

        // 开始时间
        $startTime =  $request->get('startTime');
        // 结束时间
        $endTime =  $request->get('endTime');

        $loanService = new LoanService();

        return parent::success($loanService->RepaymentList($page, $pageSize, $field, $keyword,$startTime,$endTime),'' ,true);
    }

    /**
     * 某条还款的详情列表
     *
     * @SWG\Get(
     *   path="/backend/loan/repayment/detail",
     *   tags={"【Backend】运营管理系统"},
     *   summary="某条还款的详情列表",
     *   description="某条还款的详情列表",
     *   operationId="repayment",
     *   produces={"application/json"},
     *   schemes ={"http"},
     *   @SWG\Parameter(in="header", name="X-QJJ-Sign", type="string",default="qianjinjia", required=true),
     *   @SWG\Parameter(in="query", name="pid", type="integer",default=1, description="查询的借款标的编号", required=true),
     *   @SWG\Parameter(in="query", name="page", type="integer",default=1, description="页码", required=true),
     *   @SWG\Parameter(in="query", name="pageSize", type="integer",default=10, description="每页返回数量", required=false),
     *   @SWG\Parameter(in="query", name="field", type="string", description="查询字段", required=false),
     *   @SWG\Parameter(in="query", name="keyword", type="string", description="查询字段的值", required=false),
     *   @SWG\Response(response=200, description="操作成功"),
     *   @SWG\Response(response=401, description="权限被拒绝"),
     * )
     */
    public function repayment_detail(Request $request) {
        //查看的标的编号
        $pid = empty($request->get('pid')) ? 0 : (int) $request->get('pid');
        //当前页码
        $page = empty($request->get('page')) ? 1 : (int) $request->get('page');
        //每页条数
        $pageSize = empty($request->get('pageSize')) ? 200 : (int) $request->get('pageSize');

        $loanService = new LoanService();

       return parent::success($loanService->RepaymentDetailList($pid, $page, $pageSize),'',true);
    }

    /**
     * 审核借款申请
     *
     * @SWG\Post(
     *   path="/backend/loan/approve",
     *   tags={"【Backend】运营管理系统"},
     *   summary="审核借款申请",
     *   description="审核借款申请",
     *   operationId="approve",
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
     *              property="is_approve",
     *              type="boolean",
     *          ),
     *          @SWG\Property(
     *              property="reject_note",
     *              type="string",
     *          ),
     *      )
     *   ),
     *   @SWG\Response(response=200, description="操作成功")
     * )
     */
    public function approve(Request $request) {
        //审核的借款申请编号
        $loan_apply_id = $request->json('id');
        //审核结果
        $is_approve = $request->json('is_approve');
        //审核不通过的理由
        $reject_note = empty($request->json('reject_note')) ? "" : $request->json('reject_note');

        $loanService = new LoanService();

        if ($loanService->approve($loan_apply_id, $is_approve, $reject_note)) {
            return parent::success($loanService->LoanList(1, 10), "审核成功",true);
        } else {
            parent::failed("审核失败", config('system.bkcode.approve_failed'));
        }
    }

}
