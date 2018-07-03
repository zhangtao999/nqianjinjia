<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Service\Backend\FinancingService;


/*
 * 理财管理
 * by mengxiang
 */
class FinancingController extends Controller
{
    /**
     * 债权转让列表页
     *
     * @SWG\Get(
     *   path="/backend/financing/debtList",
     *   tags={"【Backend】运营管理系统"},
     *   summary="债权转让列表页",
     *   description="债权转让列表页",
     *   operationId="debtList",
     *   produces={"application/json"},
     *   schemes ={"http"},
     *   @SWG\Parameter(in="header", name="Accept", type="string",default="application/json", required=true),
     *   @SWG\Parameter(in="header", name="X-QJJ-Sign", type="string",default="qianjinjia", required=true),
     *   @SWG\Parameter(in="query", name="page", type="integer",default=1, description="页码", required=true),
     *   @SWG\Parameter(in="query", name="pageSize", type="integer",default=10, description="每页返回数量", required=false),
     *   @SWG\Parameter(in="query", name="field", type="string", description="查询字段mobile", required=false),
     *   @SWG\Parameter(in="query", name="keyword", type="string", description="现债权人mobile", required=false),
     *   @SWG\Response(response=200, description="列表返回字段:debt_no-债权编号;serial_num-标的编号;title-标的名称;from_name-原始债权人;from_mobile-原始债权人手机号;amt-债权金额;rate-债权年化利率;debt_periods-剩余期数;loan_term-债权期数;to_name-现债权人;to_mobile-现债权人手机号;debt_status-债权状态"),
     *   @SWG\Response(response=411, description="手机号码格式不正确"),
     *   @SWG\Response(response=401, description="权限被拒绝"),
     * )
     */
    public function debtList(Request $request)
    {
        # by mengxiang
        //查询字段
        $field = empty($request->get('field')) ? '' : $request->get('field');
        //查询字段的值
        $keyword = empty($request->get('keyword')) ? '' : trim($request->get('keyword'));
        $page = $request->get('page','1');
        $pageSize =$request->get('pageSize','10');
        if(!empty($keyword)){
            if (!preg_match("/^1[34578]{1}\d{9}$/", $keyword)) {
                parent::failed('手机号码格式不正确',config("system.code.validate_mobile"));
            }
        }
        $FinancingService = new FinancingService();
        $data = $FinancingService->getDebtList($page,$pageSize,$field,$keyword);
        parent::success($data);
    }

    /**
     * 单条债权转让历史记录
     *
     * @SWG\Get(
     *   path="/backend/financing/debtList/debtRecord",
     *   tags={"【Backend】运营管理系统"},
     *   summary="单条债权转让历史记录",
     *   description="单条债权转让历史记录",
     *   operationId="debtRecord",
     *   produces={"application/json"},
     *   schemes ={"http"},
     *   @SWG\Parameter(in="header", name="X-QJJ-Sign", type="string",default="qianjinjia", required=true),
     *   @SWG\Parameter(in="query", name="debt_no", type="string",description="债权编号debt_no", required=true),
     *   @SWG\Parameter(in="query", name="page", type="integer",default=1, description="页码", required=true),
     *   @SWG\Parameter(in="query", name="pageSize", type="integer",default=10, description="每页返回数量", required=false),
     *   @SWG\Response(response=200, description="转让记录返回字段:index_id-序号;from_uname-转出人;from_mobile-转出人手机;out_time-转出日期;fact_all_amount-回款本息;to_uname=转入人;to_mobile-转入人手机;into_time-转入日期;"),
     *   @SWG\Response(response=401, description="权限被拒绝"),
     * )
     */
    public function debtRecord(Request $request){
        #by mengxiang
        $debt_no = $request->get('debt_no','');
        $page = empty($request->get('page')) ? 1 : (int) $request->get('page');
        $pageSize = empty($request->get('pageSize')) ? 200 : (int) $request->get('pageSize');
        $FinancingService = new FinancingService();
        $data = $FinancingService->getDebtRecord($page,$pageSize,$debt_no);
        parent::success($data);
    }
}
