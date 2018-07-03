<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Http\Controllers\Backend;


use App\Model\Authentic;
use App\Service\Backend\LenderService;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;
use App\Model\WithdrawCashReview;
use App\Model\Users;
use App\Model\FyAccount;

/**
 * 借款管理
 *
 * @author mashouchao
 */
class LenderController extends Controller {

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Request $request) {
        parent::__construct($request);
    }

    /**
     * 出借人投资记录
     *
     * @SWG\Get(
     *   path="/backend/order/invest_list",
     *   tags={"【Backend】运营管理系统"},
     *   summary="出借人投资记录",
     *   description="出借人投资记录",
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
    public function get_invest_list(Request $request) {
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

        $loanService = new LenderService();

       return parent::success($loanService->invest_list($page, $pageSize, $field, $keyword,$startTime,$endTime),'',true);

    }


    /**
     * 提现审核列表
     *
     * @SWG\Get(
     *   path="/backend/order/with_draw_list",
     *   tags={"【Backend】运营管理系统"},
     *   summary="提现审核列表",
     *   description="提现审核列表",
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
    public function with_draw_list(Request $request)
    {
        //当前页码
        $page = $request->get('page', 1);
        //每页条数
        $pageSize = $request->get('pageSize', 10);
        //查询字段
        $field = $request->get('field', '');
        //查询字段的值
        $keyword = $request->get('keyword', '');

        $startTime = $request->get('startTime', '');

        $endTime = $request->get('endTime', '');

        $loanService = new LenderService();

        return parent::success($loanService->with_draw_list($page, $pageSize, $field, $keyword, $startTime, $endTime),'', true);

    }


    /**
     * 提现审核
     *
     * @SWG\Get(
     *   path="/backend/order/with_draw_pass",
     *   tags={"【Backend】运营管理系统"},
     *   summary="提现审核列表",
     *   description="提现审核列表",
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
    public function with_draw_pass(Request $request)
    {
        try {
            //待审核id
            $id = $request->json('id');

            if (!$id) {
                parent::failed('no id to be pass here.', -200);
            }

            $pass = $request->json('pass');

            if (!$pass) {
                parent::failed('params error,pass must be yes or no.');
            }
            $reason = $request->json('reason');

            $loanService = new LenderService();
            $loanService->with_draw_pass($id, $pass, $reason);

            return parent::success('', '操作成功',true);
        } catch (\Exception $e) {
            parent::failed('operate error,msg:' . $e->getMessage(), -200);
        }
    }

    /**
     * 提现审核导出excel
     *
     * @SWG\Get(
     *   path="/backend/order/with_draw_export",
     *   tags={"【Backend】运营管理系统"},
     *   summary="提现审核列表",
     *   description="提现审核列表",
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
    public function with_draw_export(Request $request)
    {
        try {

            $startTime = $request->get('startTime', '');
            $endTime   = $request->get('endTime', '');

        require_once(base_path() . '/app/Libs/Excel/Classes/PHPExcel.php');
        require_once(base_path() . '/app/Libs/Excel/Classes/PHPExcel/Writer/Excel2007.php');

        Log::info(__FUNCTION__ . __LINE__ . ',start with draw pass,startTime=' . $startTime . ',endTime=' . $endTime);
        $mdb = new WithdrawCashReview();
        $mdb=$mdb->where('review_status','2');//只拉取审核通过的记录

        if ($startTime) {
            $mdb = $mdb->where('created_at', '>', $startTime);
        }
        if ($endTime) {
            $mdb = $mdb->where('created_at', '<', $endTime);
        }
        $res=$mdb->get();

        $objPHPExcel = new \PHPExcel();

        $objPHPExcel->getProperties()->setCreator("Maarten Balliauw")
            ->setLastModifiedBy("Maarten Balliauw")
            ->setTitle("Office 2007 XLSX Test Document")
            ->setSubject("Office 2007 XLSX Test Document")
            ->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.")
            ->setKeywords("office 2007 openxml php")
            ->setCategory("Test result file");
        $objPHPExcel->setActiveSheetIndex(0)
            ->setCellValue('A1', '序号')
            ->setCellValue('B1', '出借人')
            ->setCellValue('C1', '出借人手机号')
            ->setCellValue('D1', '到账金额')
            ->setCellValue('E1', '审核状态');

        //循环填充单元数据
        $b = 2;
        foreach ($res as $key => $val) {

            $objPHPExcel->setActiveSheetIndex(0)
                ->setCellValue('A' . $b, $b-1)
                ->setCellValue('B' . $b, ($res=Authentic::where('uid', $val->uid)->first()) ? $res['full_name'] : FyAccount::where('uid',$val->uid)->value('full_name'))
                ->setCellValue('C' . $b, ($res=Users::where('id',$val->uid)->first())? $res['mobile'] : '')
                ->setCellValue('D' . $b, $val->amount/100)
                ->setCellValue('E' . $b, $val->review_status===2 ? '审核通过' : '审核拒绝');

            $b = $b + 1;
        }

        //设置单元格宽度
        $objActSheet = $objPHPExcel->getActiveSheet();
        $objActSheet->getColumnDimension('C')->setWidth(18);

        $objPHPExcel->getActiveSheet()->setTitle('提现统计');
        $objPHPExcel->setActiveSheetIndex(0);

        Log::info(__FUNCTION__ . __LINE__ . ',start to send data to browser.');

        ob_end_clean(); //清除缓冲区,避免乱码

        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="with-draw-list.xls"');
        header('Cache-Control: max-age=0');
        header('Cache-Control: max-age=1');

        header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
        header('Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');
        header('Cache-Control: cache, must-revalidate');
        header('Pragma: public');

        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        $objWriter->save('php://output');

        exit;

        } catch (\Exception $e) {
            Log::info(__FUNCTION__ . __LINE__ . ',got error=' . $e->getMessage());
            echo "位置异常";
        }
    }

}
