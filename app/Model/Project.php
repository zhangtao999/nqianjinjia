<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class Project extends Model
{
    const STATUS_ONGOING = 2; //进行中的项目

    public function __construct()
    {
        $this->table = 'project';
    }

    //最多三个项目信息 按时间倒序 进行中的在前
    public function projectThreeData()
    {
        $sql  = "select id, title, status, basis_rate, extra_rate ,loan_term, loan_amount from project where status IN (2,3,5,6) AND display = 1 order by status=2 desc, id desc limit 3";
        $data = DB::select($sql);
        return $data;
    }

    /**
     * 通过id获取产品的数据
     */
    public function getProjectDataById($id)
    {
        $projectData = [];

        if($id && ($projectData = self::where(['id'=>$id])->first())) {
            $projectData = $projectData->original;
        }
        return $projectData;
    }

    /**
     * 产品列表
     */
    public function  getProjectList($p,$c)
    {
        $p = ($p - 1)*$c;
        $sql = "select id,title,loan_amount,loan_term,basis_rate,extra_rate,status from project WHERE status IN (2,3,5,6) AND display = 1 order by status=2 desc, created_at desc limit ".$p.",".$c." ";
        $projectList = DB::select($sql);
        return $projectList;
    }
    /**
     * 投资更新剩余金额，状态和满标时间
     */
    public function investUpdateData($id, $surplus_amount, $status, $full_scale_time)
    {
        $projectData = self::where(['id'=>$id])->first();
        $projectData->surplus_amount = $surplus_amount;
        if($status) {
            $projectData->status = $status;
        }
        if($full_scale_time) {
            $projectData->full_scale_time = $full_scale_time;
        }
        return $projectData->save();
    }

    /**
     * 设置项目的提前还款时间
     */
    public function earlyRepayTime($id)
    {
        $projectData = self::where(['id'=>$id])->first();
        if($projectData) {
            $projectData->early_repay_time = time();
            $projectData->status = 6;
            return $projectData->save();
        }
        return true;
    }

    /**
     * 通过id获取产品的数据
     */
    public function getProjectDataByIdWithLock($id)
    {
        $projectData = [];
        if($id && ($projectData = self::where(['id'=>$id])->lockForUpdate()->first())) {
            $projectData = $projectData->original;
        }
        return $projectData;
    }

    /**
     * 设置产品为还款结束
     */
    public function setRepayFinish($id)
    {
        if($id && ($projectData = self::where(['id'=>$id])->first())) {
            $projectData->status = 6;
            return $projectData->save();
        }

        return true;
    }

    /**
     * 获取筹标中的产品数据
     */
    public function getProjectInDoing($pid,$isMergeId=false)
    {
        if($isMergeId){//是否只是来查找合标呢
            $result=self::where('type', '2')->where('status',2);
        }else{
            $result= self::where('status',2);
        }




        $result=$result->where('id', '>', $pid)
            ->orderBy('id', 'ASC')
            ->take(10)
            ->get();

        $projectData = [];
        foreach($result as $val) {
            $projectData[] = $val->original;
        }

        return $projectData;
    }

    /**
     * 设置产品为流标
     *
     */
    public function setProjectLoss($id,$default_status=0)
    {
        $default_status=$defaule_status??4;
        $upt=['status'=>$default_status];
        if($default_status===4){
            $upt['loss_time']=time();
        }else if($default_status===3){
            $upt['full_scale_time']=time();
        }


        return self::where(['id'=>$id, 'status'=>2])->update($upt);
    }

    /**
     * 4.1.0 获取首页数据
     */
    public function getHomeProject()
    {
        $date = DB::table($this->table)
              ->whereIn('status',['2','3','5','7'])
              ->where('display','1')
              ->orderByRaw('status = 2  DESC , created_at DESC')
              ->limit(3)
              ->get();
        return $date;
    }

    /**
     * 4.1.0 获取产品列表数据
     */
    public function productList($p,$c,$rate,$term,$type)
    {
        if (empty($term) && empty($rate)) {
            $order = "created_at";
            $ginseng = "DESC";
        } elseif (!empty($rate)) {
            $order = "basis_rate";
            $ginseng = $rate;
        } elseif (!empty($term)) {
            $order = "loan_term";
            $ginseng = $term;
        }
        $data = DB::table($this->table)
            ->where('type',$type)
            ->where('display','1')
            ->whereIn('status',[2,3,5,7])
            ->orderBy($order,$ginseng)
            ->offset(($p - 1) * $c)
            ->limit($c)
            ->get()
            ->toArray();
         return $data;
    }

    /**
     * 通过合并标id取出散标id
     */
    public function mergeMappingOrdinary($merge_id,$p,$c)
    {
        $pid = DB::table($this->table)->select('id','basis_rate','extra_rate')
            ->where('merge_id', $merge_id)
            ->where('type', '1')
            ->offset(($p - 1) * $c)
            ->limit($c)
            ->get();
        return $pid;
    }

    /**
     * 加锁获取集合标
     */
    public function getProjectGatherWithLock($id)
    {
        $surplusAmount = 0;     // 剩余可投金额
        $singleProject = [];    // 散标
        $gatherProject = [];    // 集合标
        $loanApplyProject = new LoanApplyProject();
        $loanApply = new LoanApply();
        $fyAccount = new FyAccount();
        $errorMessage = '';
        if($id && ($result = self::where(['id'=>$id])->orWhere(['merge_id'=>$id])->lockForUpdate()->get())) {
            foreach ($result as $val) {
                if($val->id != $id) {
                    if($val->surplus_amount > 0) {
                        // 散标
                        $tmp = $val->original;
                        $aid = $loanApplyProject->getAidByPid($val->id);
                        $loanApplyData = $loanApply->getDataById($aid);
                        // 散标借款人ID
                        $tmp['uid'] = $loanApplyData['uid'];
                        // 借款人富友账户
                        $tmp['mobile'] = $fyAccount->getMobileById($tmp['uid']);
                        if(!$tmp['mobile']) {
                            $errorMessage = '借款人富有账户有问题';
                        }
                        // 剩余可投金额
                        $surplusAmount += $val->surplus_amount;
                        $singleProject[] = $tmp;
                    }
                }else {
                    $gatherProject = $val->original;
                }
            }
        }

        if($errorMessage) {
            return $errorMessage;
        }else {
            return [$gatherProject, $singleProject, $surplusAmount];
        }
    }

    //债转的产品信息
    public function zhaiZhuanXinXi($project_id)
    {
        $sql = "select 
                serial_no,loan_term, lock_day, repay_method, id as project_id, type
                from project where id = ?";

        $data = DB::select($sql, [$project_id]);
        return $data[0];
    }

    /**
     * 通过id获取title
     */
    public function productTitle($pid)
    {
        Log::info(__FUNCTION__.'<'.__LINE__.'id = '.$pid);
        $data  = DB::table($this->table)->select('title')->where('id', $pid)->first();
        if(!empty($data)){
            return $data->title;
        }
        Log::info(__FUNCTION__.'<'.__LINE__.'id = '.$pid);
        return [];
    }


    /**
     * 获取合并标下面的所有散标ID
     */
    public function getPidsFromMergeProject($id)
    {
        $pids = [];
        if($id && ($result = self::where(['merge_id'=>$id])->get())) {
            foreach ($result as $val) {
                $pids[] = $val->id;
            }
        }

        return $pids;
    }

    /**
     * 通过id获取标的状态
     */
    public function project_status($id)
    {
        Log::info(__FUNCTION__.'<'.__LINE__.'id = '.$id);
        $data = DB::table($this->table)->select('status')->where('id', $id)->first();
        Log::info(__FUNCTION__.'<'.__LINE__.'data = ' , $data);
        if(!empty($data)){
            return $data->status;
        }
        return [];
    }
    //获取借款人的手机号
    public function getBorrowerMobileUid($pid)
    {
        $sql = 'select c.mobile, c.uid from project p 
                join loan_apply_project a on p.id = a.pid join loan_apply o on o.id = a.aid 
                join fy_account c on c.uid = o.uid where p.id = ? limit 1';

        $data = DB::select($sql, [$pid]);
        return $data[0];
    }

    //产品的总期数
    public function getAllTerms($pid)
    {
        $sql = 'select loan_term from project 
                where id = ?';

        $data = DB::select($sql, [$pid]);
        return $data[0];
    }

    /**
     * 获取合并内散标的剩余金额
     */
    public function getMergeProjectSurplusAmount($mergeId)
    {
        return self::where(['merge_id'=>$mergeId])->lockForUpdate()->sum('surplus_amount');
    }

    /**
     * 通过产品id获取产品的display
     */
    public function projectDisplay($pid)
    {
        $data = DB::table($this->table)->where(['id'=>$pid])->select('display')->first();
        return $data->display;
    }

    /**
     * 获取合标里散标的状态不等于6的数量
     */
    public function getNoFinishNum($mergeId)
    {
        return self::where(['merge_id'=>$mergeId])->where('status', '<', 6)->count();
    }
}
