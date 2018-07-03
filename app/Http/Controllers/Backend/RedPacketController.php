<?php

namespace App\Http\Controllers\Backend;

use App\Model\Lender;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Model\FyAccount;
use App\Fuiou\Fuiou;
use App\Model\FyFundRecord;
use App\Model\LenderFundRecord;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;

/**
 * 后端红包管理
 *
 * @author mashouchao
 */
class RedPacketController extends Controller {

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Request $request) {
        parent::__construct($request);
    }

    /**
     * 获取红包列表
     *
     * @SWG\Get(
     *   path="/backend/redpacket/list",
     *   tags={"【Backend】运营管理系统"},
     *   summary="获取红包列表",
     *   description="获取红包列表",
     *   operationId="version",
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
     *              property="pageSize",
     *              type="integer",
     *          ),
     *          @SWG\Property(
     *              property="currentPage",
     *              type="integer",
     *          ),
     *          @SWG\Property(
     *              property="searchUserName",
     *              type="string",
     *          ),
     *      )
     *   ),
     *   @SWG\Response(response=200, description="操作成功"),
     * )
     */
    public function redpacket_list(Request $request) {


        $pageSize =$request->get('pageSize');	    // 金额单位为分
        $currentPage=$request->get('currentPage');
        $to_uid=$request->get('to_uid');

        $pageSize=$pageSize?$pageSize:20; // 默认20
        $currentPage=$currentPage?$currentPage:1;

        $fyFound =new FyFundRecord();

         // 查询红包额度
        if ($res=$fyFound->findRedpacketRecord($to_uid,$currentPage,$pageSize)){
            parent::success($res);

        }
        parent::failed("没有数据",201);

    }


    /**
     * 获取出借人列表
     *
     * @SWG\Get(
     *   path="/backend/redpacket/lender_list",
     *   tags={"【Backend】运营管理系统"},
     *   summary="获取出借人列表",
     *   description="获取出借人列表",
     *   operationId="version",
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
     *              property="pageSize",
     *              type="integer",
     *          ),
     *          @SWG\Property(
     *              property="currentPage",
     *              type="integer",
     *          ),
     *          @SWG\Property(
     *              property="mobile",
     *              type="string",
     *          ),
     *          @SWG\Property(
     *              property="name",
     *              type="string",
     *          ),
     *      )
     *   ),
     *   @SWG\Response(response=200, description="操作成功"),
     * )
     */
    public function lender_list(Request $request) {
        return $this->render_lender_list(function ($request,&$backData){
            $backData['pageSize'] =     $request->get('pageSize',10);	    // 金额单位为分
            $backData['currentPage']=   $request->get('currentPage',1);
            $backData['mobile']=        $request->get('mobile');
            $backData['name']=          $request->get('name');
            return null;
        },$request);
    }

    private function render_lender_list($func,$request,$backData=null){
        list($code,$msg)=call_user_func_array($func,[$request,&$backData]);
        Log::info(__FILE__ .__FUNCTION__.__LINE__.'lender_list start with params=',$backData);

        if($code==-1){
            return parent::failed($msg,201,true);
        }

        $lender=new Lender();

        // 查询红包额度
        if ($res=$lender->getLenderList($backData['mobile'],$backData['name'],$backData['currentPage'],$backData['pageSize'])){

            return parent::success($res,'',true);
        }

        return parent::failed("获取数据失败",201,true);

    }

    /**
     * 发送红包接口
     *
     * @SWG\Post(
     *   path="/backend/redpacket/send",
     *   tags={"【Backend】运营管理系统"},
     *   summary="发送红包给出借方",
     *   description="发送红包给出借方",
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
     *              property="amount",
     *              type="integer",
     *          ),
     *          @SWG\Property(
     *              property="uid",
     *              type="integer",
     *          ),
     *          @SWG\Property(
     *              property="remark",
     *              type="string",
     *          ),
     *      )
     *   ),
     *   @SWG\Response(response=200, description="操作成功")
     * )
     */
    public function send_redpacket_to_lender(Request $request) {
        return $this->render_send_redpacket_to_lender(function ($request,&$backData){
            $backData['amt'] = $request->json('amount',0);        // 金额单位为分
            $backData['uid'] = $request->json('uid');
            $backData['remark'] = $request->json('remark');

            Log::info(__FUNCTION__ . __LINE__ . 'send_redpacket_to_lender start with params=', $backData);

            if (!$backData['uid']) {

                throw new \Exception('params must contain uid');
            }

            if (!is_numeric($backData['amt'] )) {
                throw new \Exception('Amount must be number');
            }

            if ($backData['amt'] <1 || $backData['amt'] >99999.99) {

                throw new \Exception('0<Amount≤99,999.99');
            }

            $backData['amt'] =$backData['amt'] * 100;   // 转换为分

        },$request);

    }

    private function render_send_redpacket_to_lender($func,$request,$backData=null){
        try {
            call_user_func_array($func,[$request,&$backData]);

            // 构造富有付款参数
            $fyAccount = new FyAccount();
            $fyAccountData = $fyAccount->getFyDataById($backData['uid']);            // 查询用户富友账户数据
            if (!$fyAccountData) {
                Log::info(__FUNCTION__ . __LINE__ . 'get gyAccountData error, with uid=' . $backData['uid']);
                parent::failed("此用户暂未初始化富有账户!", config('system.bkcode.send_redpacket_failed'));
            }


            $platformAccount = config("system.fy_platform_account");    // 查询平台户账户

            if (!$platformAccount) {
                Log::alert(__FUNCTION__ . __LINE__ . '查询平台户账户错误。');
                throw new \Exception('查询平台户账户错误');
            }

            // =============构造富有参数=============数据库插入成功后开始提交红包请求========开始=======
            $data = [
                'out_cust_no' => $platformAccount,
                'in_cust_no' => $fyAccountData['mobile'],
                'amt' => $backData['amt'],
            ];

            Log::info(__FUNCTION__ . __LINE__ . ',send data =' . print_r($data, true));

            $fuiou = new Fuiou();
            $fuiou->transferAccounts();
            $fuiou->request($data);
            //调用付款接口.
            $response = $fuiou->response();

            Log::info(__FUNCTION__ . __LINE__ . ',send to fuyou,and resul=' . print_r($response, true));

            $status = 2;// 默认成功
            if (!(isset($response['msg']['resp_code']) && $response['msg']['resp_code'] === '0000')) {
                $status = 3;
                Log::alert(__FUNCTION__ . __LINE__ . '，send to fuyou faild');
            }
            // =============构造富有参数发送======================结束======

            $fyFoundRec = new FyFundRecord();
            $lenderFoundRec = new LenderFundRecord();

            //更新富有fy_fund_record
            if (!$fyFoundRec->addRedpacketRecord($platformAccount, $backData['amt'], $backData['uid'] /*这个在这里表示to_uid*/, $status)) {
                Log::alert(__FUNCTION__ . __LINE__ . ',update fy_fund_record faild ');
                //$res=["code"=>-1,"msg"=>"保存数据失败"];

                throw new \Exception('保存数据失败');

            }
            // DB::beginTransaction();

            if ($status == 2 && !$lenderFoundRec->addReward($backData['uid'], $backData['amt'], $backData['remark'])) {   //更新lender_fund_record,只有红包发送成功后写入数据
                //$res = ["code" => -1, "msg" => "保存数据失败"];

                Log::alert(__FUNCTION__ . __LINE__ . ',update lender_fund_record faild ');
                throw new \Exception('保存数据失败');
            }

            if ($status == 3) {
                throw new \Exception('发送红包失败');
            }
            Log::info(__FUNCTION__ . __LINE__ . '，send to fuyou success ');

            // 转账成功
            return parent::success(null, '操作成功',true);
        }catch (\Exception $e){
            return parent::failed($e->getMessage(), config('system.bkcode.send_redpacket_failed'),true);
        }
    }

}
