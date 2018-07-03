<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Http\Controllers\Backend;


use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Service\Backend\ProjectService;
use App\Service\BorrowerRepayService;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use App\Model\Project;

/**
 * 标的管理
 *
 * @author mashouchao
 */
class ProjectController extends Controller {

    const CREATE_REPAYMENT_FAILED='创建还款计划失败2 ';
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct(Request $request) {
        parent::__construct($request);
    }

    /**
     * 标的列表
     *
     * @SWG\Get(
     *   path="/backend/project/list",
     *   tags={"【Backend】运营管理系统"},
     *   summary="标的列表",
     *   description="标的列表",
     *   operationId="project",
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
    public function project(Request $request) {

        // 当前页码
        $page = $request->get('page','1');
        // 每页条数
        $pageSize =$request->get('pageSize','10');
        // 查询字段
        $field =  $request->get('field','');
        // 查询字段的值
        $keyword = $request->get('keyword','');

        $projectService = new ProjectService();

        return parent::success($projectService->ProjectList($page, $pageSize, $field, $keyword),"",true);
    }

    /**
     * 合并标的
     *
     * @SWG\Post(
     *   path="/backend/project/merge",
     *   tags={"【Backend】运营管理系统"},
     *   summary="合并标的",
     *   description="合并标的 , ",
     *   operationId="project",
     *   produces={"application/json"},
     *   schemes ={"http"},
     *   @SWG\Parameter(in="header", name="X-QJJ-Sign", type="string",default="qianjinjia", required=true),
     *   @SWG\Parameter(in="query", name="ids", type="integer",default=1, description="页码", required=true),
     *   @SWG\Response(response=200, description="操作成功"),
     *   @SWG\Response(response=401, description="权限被拒绝"),
     * )
     */
    public function project_merge(Request $request) {
        return $this->render_project_merge(function ($request,&$ids,&$backData){
            // id集合
            $ids = $request->json('ids');

            if(!$ids){
                Log::info(__FUNCTION__.__LINE__.",merge project ,no id sets here.");
                throw new \Exception("no id sets here.");
            }

            // 获取project信息
            $backData['title']          =   $request->json('title');                // 标题
            $backData['loan_amount']    =   $request->json('loan_amount')*100;      // 合标借款总金额
            $backData['loan_term']      =   $request->json('loan_term');            // 借款期限，单位为月
            $backData['profit_calcula'] =   $request->json('profit_calcula');       // 收益计算方式，1/满标D+1起息
            $backData['basis_rate']     =   $request->json('basis_rate')*100;       // 基础年化利率，单位万分之一
            $backData['repay_method']   =   $request->json('repay_method',1);       // 还款方式，1/到期返本付息(默认1)
            $backData['lowest_amount']  =   $request->json('lowest_amount')*100;    // 最低起投金额
            $backData['is_novice']      =   $request->json('is_novice');            // 新手标
            $backData['raise_term']     =   $request->json('raise_term');           // 募集期限
            $backData['quota_unit']     =   $request->json('quota_unit')*100;       // 递增投资金额
            $backData['is_novice']      =   $request->json('is_novice',0);          // 是否新手标
            $backData['lock_day']       =   $request->json('lock_day',30);          // 标的锁定期,默认30
            $backData['introduce']      =   $request->json('introduce');            // 产品介绍

            $a_time                     =   date("Y-m-d H:i:s");             // '2018-05-25 10:10:00';
            $b_time                     =   strtotime($a_time);
            $b_time                     =   strtotime('+1 Minute',$b_time);    // 这里合标的到期时间比所有三包最低的期限多一分钟。

            //TODO 是否可以用DB time
            $backData['release_time']   =   $b_time;                                // 发布时间
            $backData['type']           =   2;                                      // 这里是合标
            $backData['status']         =   2;                                      // 默认合标status的状态为2，募集中


            Log::info(__FUNCTION__.__LINE__.",project_merge start with params=",$backData);
        },$request);

    }
    // project_merge方法业务处理
    private function render_project_merge($func,$request,$ids=null,$backData=null){
        $isCommit=false;
        try {
            DB::beginTransaction();
            $isCommit=true;
            DB::query('LOCK tables project WRITE');// 锁定project 表可读可写。
            call_user_func_array($func, [$request, &$ids,&$backData]);

            $projectService = new ProjectService();
            $projectService->ProjectMerge($ids,$backData);

            DB::commit();
            DB::query('UNLOCK TABLES;');// 表解锁
            return parent::success(null, "合标成功。", true);

        }catch (\Exception $e) {
            if ($isCommit){
                DB::rollBack();
                DB::query('UNLOCK TABLES;');// 表解锁
            }
            Log::info(__FUNCTION__.__LINE__.",merge project error, and cache Exception=",$e->getMessage());
            return parent::failed("error:" . $e->getMessage(), -200, true);
        }
    }

    /**
     * 合标列表
     *
     * @SWG\Get(
     *   path="/backend/project/merge_list",
     *   tags={"【Backend】运营管理系统"},
     *   summary="合标列表",
     *   description="合标列表 , ",
     *   operationId="project",
     *   produces={"application/json"},
     *   schemes ={"http"},
     *   @SWG\Parameter(in="header", name="X-QJJ-Sign", type="string",default="qianjinjia", required=true),
     *   @SWG\Parameter(in="query", name="ids", type="integer",default=1, description="页码", required=true),
     *   @SWG\Response(response=200, description="操作成功"),
     *   @SWG\Response(response=401, description="权限被拒绝"),
     * )
     */
    public function merge_list(Request $request){
        try {
            $pageSize = $request->get('pageSize', 10);
            $page = $request->get('page', 1);
            $serial_no = $request->get('keyword');
            $field= $request->get('field');


            return parent::success((new ProjectService())->getMergeList($page, $pageSize,$field, $serial_no), null, true);
        }catch (\Exception $e){
            return parent::failed('get list error,'.$e->getMessage(), -200, true);
        }

    }


    /**
     * 生成标的，编辑标的信息
     *
     * @SWG\Post(
     *   path="/backend/project/edit",
     *   tags={"【Backend】运营管理系统"},
     *   summary="生成标的",
     *   description="生成标的，编辑标的信息",
     *   operationId="edit",
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
     *              property="basis_rate",
     *              type="integer",
     *          ),
     *          @SWG\Property(
     *              property="introduce",
     *              type="string",
     *          ),
     *          @SWG\Property(
     *              property="increase_money",
     *              type="integer",
     *          ),
     *          @SWG\Property(
     *              property="max_money",
     *              type="integer",
     *          ),
     *          @SWG\Property(
     *              property="loan_term",
     *              type="integer",
     *          ),
     *          @SWG\Property(
     *              property="lowest_amount",
     *              type="integer",
     *          ),
     *          @SWG\Property(
     *              property="profit_calcula",
     *              type="integer",
     *          ),
     *          @SWG\Property(
     *              property="raise_term",
     *              type="integer",
     *          ),
     *          @SWG\Property(
     *              property="repay_method",
     *              type="integer",
     *          ),
     *          @SWG\Property(
     *              property="type",
     *              type="integer",
     *          ),
     *      )
     *   ),
     *   @SWG\Response(response=200, description="操作成功")
     * )
     */
    public function edit(Request $request) {
        return $this->render_edit(function ($request,&$params){
            $params['id'] = $request->json('id');
            if(!$params['id']){
                throw new \Exception('Id need here.');
            }

            //标的名称
            $params['title'] = $request->json('title');
            //年化利率
            $params['basis_rate'] = $request->json('basis_rate');
            //项目介绍
            $params['introduce'] = $request->json('introduce');
            //递增金额
            $params['increase_money'] = $request->json('increase_money');
            //最大金额
            $params['max_money'] = $request->json('max_money');
            //借款期限 月
            $params['loan_term'] = $request->json('loan_term');
            //起投金额，最低出借金额
            $params['lowest_amount'] = $request->json('lowest_amount');
            //起息方式，收益计算方式
            $params['profit_calcula'] = $request->json('profit_calcula');
            //募集期限
            $params['raise_term'] = $request->json('raise_term');
            //还款方式
            $params['repay_method'] = $request->json('repay_method');
            //标的类型
            $params['is_novice'] = $request->json('is_novice');
            //锁定期（天），默认30
            $params['lock_day'] = $request->json('lock_day',30);

            Log::info(__FUNCTION__.__LINE__.',collect edit params end ,and params=',$params);
        },$request);
    }

    private function render_edit($func,$request,$data=null){
        try{
            call_user_func_array($func,[$request,&$data]);

            if (($projectService = new ProjectService())->ProjectEdit($data)) {
                return parent::success($projectService->ProjectList(1, 20), '生成成功',true);
            } else {
                parent::failed("生成标的失败", config('system.bkcode.project_generate_failed'));
            }

        }catch (\Exception $e){
            Log::alert(__FUNCTION__.__LINE__.',render edit error='.$e->getMessage());

            parent::failed("生成标的失败", config('system.bkcode.project_generate_failed'));
        }

    }


    /**
     * 散标或者合并标，满标审核通过
     *
     * @SWG\Post(
     *   path="/backend/project/pass",
     *   tags={"【Backend】运营管理系统"},
     *   summary="满标审核通过",
     *   description="满标审核通过",
     *   operationId="pass",
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
    public function pass(Request $request,$dbIsBegin=false) {
        try {
            $id = $request->json('id');
            $isMerge=$request->json('isMerge');

            if(!$id){throw new \Exception("没有对应的标id" );}
            DB::beginTransaction();
            // start db transaction
            $dbIsBegin=true;

            // lock project table to writable
            DB::query('LOCK tables project WRITE');

            // get project data here
            $pobj=Project::where('id',$id)->first();

            // if exist merge_id equal 'yes' and project type equal 2, that is merge project,   merge project pass.
            if($isMerge=='yes' && intval($pobj['type'])==2) {
                Log::info(__FILE__ .__FUNCTION__.__LINE__.'，project pass mulit start,id='.$id);

                // modify current merge project status to 'release money'
                if (!Project::where('id',$id)->update(['status' => 5, 'grant_time' => time()])){
                    throw new \Exception( ",合标状态更新为已放款失败: " );
                }

                // get merge project's single project which type equal q and merge_id=pid
                $pobjs = Project::where('merge_id', $id)->where('type', 1)->get();
                foreach ($pobjs as $i => $item) {
                    // single project already passed ,just skip
                    if ($item['status'] ==5 ) {
                        Log::info(__FUNCTION__.__LINE__.'，project id='.$item['id'].' had already passed, skip.');
                        continue;
                    }

                    // when status not equal full status ,just throw a exception.
                    if($item['status'] !=3 ) {
                        Log::info(__FUNCTION__.__LINE__.'，project id='.$item['id'].' status not equal 3,pass skip start item='.$item['title']);
                        throw new \Exception("必须每一个散标项目都在满标状态才能审核通过" );
                    }
                    $projectService = new ProjectService();
                    $borrowerRepay = new BorrowerRepayService();
                    $borrowerRepay->__set('pid', $item->id);
                    // create repayment plane
                    if (($res_back=$borrowerRepay->createBorrowerRepayPlan()) === true) {
                        // modify all single project status and send message notification.
                        $res = $projectService->ProjectPass($item['id']);
                        if ($res['code'] == -1) {
                            throw new \Exception($item['title'].",审核失败: " . $res['msg']);
                        }
                    }else{
                        throw new \Exception($item['title'].",创建还款计划失败1,".$res_back);
                    }
                }

            }else if(intval($pobj['type']) == 1){// single project to pass
                Log::info(__FILE__ . __FUNCTION__ . __LINE__.'，project pass single start,id='.$id);

                // just full status project can be passed.
                if(intval($pobj['status']) != 3){
                    throw new \Exception($pobj['title'].",不在满标状态 " );
                }

                $projectService = new ProjectService();
                $borrowerRepay = new BorrowerRepayService();
                $borrowerRepay->__set('pid', $id);
                // create repayment plane.
                if($borrowerRepay->createBorrowerRepayPlan() == true){
                    Log::info(__FUNCTION__.__LINE__.',single project create borrower repay plan success.');

                    $res = $projectService->ProjectPass($id);
                    if ($res['code'] == -1) {
                        throw new \Exception("审核失败: ".$res['msg']);
                    }

                    // start catch all merge project's sub proj ,if it all passed ,change the merge project status to passed.
                    if ($pobj->merge_id){
                        // get merge project which id equal merge_id.
                        $passCount = Project::where('merge_id', $pobj->merge_id)
                            ->where('type', 1)
                            ->where("status",'in','(2,3)')
                            ->count();

                        Log::info(__FUNCTION__.__LINE__.',end single project passed ,get all single project of merge project ,which status =3, count='.$passCount);

                        // if here no project which have not passed,now start change its parent project status to 5.
                        if($passCount == 0){
                            if(!Project::where('id', $pobj->merge_id)->update(['status' => 5, 'grant_time' => time()])){
                                Log::alert(__FILE__ .__FUNCTION__.__LINE__.',project update error ,id='.$id);
                                throw new \Exception("散标对应的合标修改为满标状态失败: ");
                            }
                        }else{
                            Log::info(__FUNCTION__.__LINE__.',skip update merge project ,because status=2 or 3 have: passCount='.$passCount);
                        }
                    }
                }else{
                    throw new \Exception(self::CREATE_REPAYMENT_FAILED );
                }
            }else{
                throw new \Exception("what? why type has other value, must equal 1 or 2. ");
            }

            DB::commit();
            DB::query('UNLOCK TABLES;');// unlock tables
            $projectService = new ProjectService();
            return parent::success($projectService->ProjectList(1, 20), '放款成功',true);
        }catch (\Exception $e){
            Log::alert(__FILE__ .__FUNCTION__.__LINE__.'，project pass with error='.$e->getMessage());
            if($dbIsBegin){
                DB::rollBack();
                DB::query('UNLOCK TABLES;');// unlock tables.
            }
            parent::failed("审核失败: ".$e->getMessage(), config('system.bkcode.approve_failed'));
        }
    }

}
