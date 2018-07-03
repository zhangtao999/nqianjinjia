<?php

namespace App\Model;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class BorrowerRepay extends Model
{

    const BORROWER_REPAY_DATA_ALREADY = '还款计划数据已存在';

    protected $table = 'borrower_repay';

    /**
     * 新增借款人还款记录数据
     */
    public function addBorrowerRepayData($data)
    {
        $this->uid = $data['uid'];
        $this->pid = $data['pid'];
        $this->lid = $data['lid'];
        $this->corpus = $data['corpus'];
        $this->interest = $data['interest'];
        $this->period   = $data['period'];
        $this->status   = 0;
        $this->repay_time = $data['repay_time'];
        return $this->save();
    }

    /**
     * 设置借款人还款数据的状态从无效状态变成未还状态
     */
    public function setBorrowerRepayStatusEq1($uid, $pid)
    {
        return self::where(['uid'=>$uid, 'pid'=>$pid])->update(['status'=>1]);
    }

    /**
     * 获取未还款的还款计划的数据
     */
    public function getBorrowerNoRepayData($uid, $pid)
    {
        $result = self::where(['uid'=>$uid, 'pid'=>$pid])->whereIn('status', [1,4])->get();
        $borrowerNoRepayData = [];
        $allCorpus = 0;
        $loanApplyId = 0;
        $overdueInterest = 0;
        $noRepayInvestInterest = 0;
        $overdueInvestInterest = 0;
        $anotherNoRepayInterest = 0;
        $anotherOverdueInterest = 0;
        foreach ($result as $key=>$val) {
            if($val['status'] == 1 && $key==0) {
                $noRepayInvestInterest = $val->invest_interest;
            }elseif($val['status'] == 4) {
                $overdueInvestInterest += $val->invest_interest;
            }
            $borrowerNoRepayData[] = $val->original;
            $allCorpus += $val->corpus;
            $loanApplyId = $val->lid;
            $overdueInterest += $val->overdue_interest;
            if($val['status'] == 1 && $key==0) {
                $anotherNoRepayInterest = $val->interest - $val->invest_interest;
            }elseif($val['status'] == 4) {
                $anotherOverdueInterest += $val->interest - $val->invest_interest;
            }
        }
        $anotherNoRepayInterest = $anotherNoRepayInterest < 0 ? 0 : $anotherNoRepayInterest;
        $anotherOverdueInterest = $anotherOverdueInterest < 0 ? 0 : $anotherOverdueInterest;

        $allCorpus = $allCorpus + $noRepayInvestInterest + $overdueInvestInterest;
        $anotherInterest = $anotherNoRepayInterest + $anotherOverdueInterest + $overdueInterest;
        return [$borrowerNoRepayData, $allCorpus, $loanApplyId, $anotherInterest];
    }

    /**
     * 获取提前还款/数据/金额
     */
    public function getAdvanceRepayment($uid,$pid)
    {
        exit('弃用');
        $result = self::where(['uid'=>$uid, 'pid'=>$pid, 'status'=>1,])->get();
        $sql = "select * from borrower_repay WHERE uid = $uid AND  pid = $pid AND status IN ('1','4')";
        $result = DB::select($sql);
        $result = json_decode(json_encode($result), true);
        $borrowerNoRepayData = [];
        $allCorpus = 0;
        $overdue_interest = 0;
        foreach ($result as $key => $val)
        {
            $borrowerNoRepayData[] = $val;
            $allCorpus += $val['corpus'];
            $overdue_interest +=$val['overdue_interest'];
        }
        $allCorpus = $borrowerNoRepayData[0]['interest']+$allCorpus+$overdue_interest;
        return [$borrowerNoRepayData,$allCorpus];
    }

    /**
     * 设置未还款的还款计划数据为已还款，用于提前还款
     */
    public function setBorrowerNoRepayData($uid, $pid)
    {
        $result1 = self::where(['uid'=>$uid, 'pid'=>$pid, 'status'=>1])->update(['status'=>2, 'repay_type'=>2]);
        $result2 = self::where(['uid'=>$uid, 'pid'=>$pid, 'status'=>4])->update(['status'=>3, 'repay_type'=>2]);
        return $result1 || $result2;
    }

    /**
     * 获取未还款的还款记录
     */
    public function getBorrowNoRepay($uid)
    {
        $sql = "select r.*,l.term,l.rate,l.quota from borrower_repay as r LEFT JOIN project as p ON r.pid = p.id LEFT JOIN loan_apply as l ON r.lid = l.id  WHERE r.uid = $uid  AND p.status = 5 ";
        $data = DB::select($sql);
        return $data;
    }

     /**
     * 获取当天所有需要还款的还款计划数据
     */
    public function getAllNoRepayDataInDay($startTime, $endTime)
    {
        $result = self::where('status',1)->where('repay_time','>=',$startTime)->where('repay_time','<',$endTime)->get();
        $allNoRepayData = [];
        foreach ($result as $val) {
            $allNoRepayData[] = $val->original;
        }
        return $allNoRepayData;
    }

    /**
     * 获取当天一条需要还款的还款计划数据
     */
    public function getOneNoRepayDataInDay($startTime, $endTime)
    {
        $noRepayData = self::where('status',1)
                        ->where('repay_time','>=',$startTime)
                        ->where('repay_time','<',$endTime)->first();
        if($noRepayData) {
            return $noRepayData->original;
        }
        return NULL;
    }

    /**
     * 设置还款计划为逾期未还
     */
    public function setRepayDataOverdue($id)
    {
        if($id && ($repayData = self::where(['id'=>$id])->first())) {
            $repayData->status = 4;
            $repayData->overdue_date = strtotime(date('Y-m-d'));
            return $repayData->save();
        }

        return false;
    }

    /**
     * 设置还款计划为正常还款
     */
    public function setRepayDataRepaid($id)
    {
        if($id && ($repayData = self::where(['id'=>$id])->first())) {
            $repayData->status = 2;
            return $repayData->save();
        }

        return false;
    }

    /**
     * 查询同产品是否有未还款的记录
     */
    public function getNoRepayDataInTheProject($pid, $id)
    {
        $sql = "select id from `borrower_repay` where pid=? and status IN (1,4) and id!=? limit 1";
        return DB::select($sql, [$pid, $id]);
    }

    /**
     * 设置当天所有需要还款的还款计划为已还款
     */
    public function setAllNoRepayDataInDay($startTime, $endTime)
    {
        return self::where('status',1)->where('repay_time','>=',$startTime)->where('repay_time','<',$endTime)->update(['status'=>2]);
    }

    /**
     * 获取用户的还款记录
     */
    public function getAlreadyRepaid($uid,$p,$c)
    {
         $where['uid'] = $uid;
         $where['status'] = '2';
         return DB::table($this->table)->where($where)->orderby('repay_time','desc')->offset(($p-1)*$c)->limit($c)->get();
    }

    /**
     * 获取还款详情
     */
    public function getRepayDetail($repay_id)
    {
        $where['id'] = $repay_id;
        $data = DB::table($this->table)->where($where)->first();
        return $data;
    }

    /**
     * 获取已用户一个借款已还多少
     */
    public function alreadyRepaid($pid)
    {
       return DB::table($this->table)->where('pid','=',$pid)->get();
    }

    /**
     * 获取一条还款计划数据
     */
    public function getOneBorrowerRepayData($uid, $pid)
    {
        $borrowerRepayData = [];
        if($result = self::where(['uid'=>$uid, 'pid'=>$pid])->first()) {
            $borrowerRepayData = $result->original;
        }

        return $borrowerRepayData;
    }

    /**
     * 获取还款项目详情
     */
    public function reapyProjectDetail($where)
    {
        $data = DB::table($this->table)->where($where)->get();
        return $data;
    }

    /**
     * 批量插入还款数据
     */
    public function batchAddBorrowerRepayData($pid, $batchData)
    {
        if($batchData) {
            if(!self::where(['pid'=>$pid])->first()) {
                if(DB::table('borrower_repay')->insert($batchData)) {
                    return true;
                }
            }else {
                return self::BORROWER_REPAY_DATA_ALREADY;
            }
        }
        return false;
    }

    /**
     * 获取用户提前还款数据
     */
    public function advanceRepay($uid)
    {
        $sql = "select MAX(b.id) AS id ,b.pid,SUM(b.corpus) AS repayment_sum,SUM(b.overdue_interest) AS overdue_interest,MAX(b.interest) AS interest ,MAX(b.`repay_type`) AS repay_type,MAX(p.`early_repay_time`) AS repay_time,
               (select SUM(interest) from borrower_repay WHERE uid = $uid AND status = 3 AND repay_type = 2 AND pid = b.pid) AS overdue_sum
               from borrower_repay AS b LEFT JOIN project as p ON b.pid = p.id
               WHERE b.status IN (2,3) AND b.repay_type = 2 AND b.uid = $uid
               GROUP BY b.pid ";
        $data = DB::select($sql);
        $result = json_decode(json_encode($data), true);
        return $result;
    }

    /**
     * 获取提前还款金额
     */
    public function overdue_sum($uid,$pid)
    {

        $data = self::where(['uid'=>$uid])->whereIn('status', [2,3])->where('repay_type','2')->where('uid','=',$uid)->where('pid','=',$pid)->get();
        $result = json_decode(json_encode($data), true);
        $allCorpus = 0;
        $overdueInterest = 0;
        $normalInterest = 0;
        $overdueFine = 0;
        foreach ($result as $val) {
            $allCorpus += $val['corpus'];
            if($val['status'] == 2) {
                $normalInterest = $val['interest'];
            }elseif($val['status'] == 3) {
                $overdueInterest += $val['interest'];
                $overdueFine += $val['overdue_interest'];
            }
        }
        $repaymentSum = $allCorpus + $normalInterest + $overdueFine + $overdueInterest;
        return $repaymentSum;
    }

    /**
     * 获取用户自动还款数据
     */
    public function automaticRepay($uid)
    {
        $data = DB::table($this->table)->where('uid',$uid)->whereIN('status',['2','3'])->where('repay_type','1')->select('id','repay_time','pid','corpus','interest','repay_type','overdue_interest')->get()->toArray();
        $result = json_decode(json_encode($data), true);
        return $result;
    }

    /**
     * 提前还款的详情
     */
    public function advanceRepayInfo($project_id,$repay_type)
    {
        $sql = "select SUM(b.corpus) AS corpus,SUM(b.overdue_interest) AS overdue_interest,MAX(b.interest) AS interest,repay_type,
        (select `early_repay_time`  from project where id=b.pid) AS repay_time 
         from `borrower_repay` AS  b where b.`repay_type` =$repay_type and b.pid=$project_id GROUP BY b.`pid` ,b.`repay_type` ";
        $data = DB::select($sql);
        $result = json_decode(json_encode($data),true);
        return $result[0];
    }

    /**
     * 获取一条逾期数据
     */
    public function getOneOverdueData($id)
    {
        $result = self::where(['status'=>4])->where('id', '>', $id)->lockForUpdate()->orderBy('id', 'ASC')->first();
        if($result) {
            return $result->original;
        }

        return NULL;
    }

    /**
     * 设置逾期数据
     */
    public function setOverdueData($id, $overdueDayNum, $overdueInterest)
    {
        $overdueDate = strtotime(date('Y-m-d'));
        return self::where(['id'=>$id, 'status'=>4])
            ->update(['overdue_date'=>$overdueDate, 'overdue_day'=>$overdueDayNum, 'overdue_interest'=>$overdueInterest]);
    }

    /**
     * 判断是否有预期数据
     */
    public function expectDate($apply_id)
    {
        $data = DB::table($this->table)->where('status','=','4')->where('lid','=',$apply_id)->get();
        $result = json_decode(json_encode($data),true);
        if(empty($result)){
            return '1';
        }elseif (!empty($result)){
            return '2';
        }
    }

    /**
     * 获取借款人还款数据
     */
    public function getBorrowerRepayData($id)
    {
        if($id && ($borrowerRepayData = self::where(['id'=>$id])->first())) {
            return $borrowerRepayData->original;
        }

        return NULL;
    }

    /**
     * 设置借款人还款数据为逾期还款
     */
    public function setAlreadyOverdueData($id)
    {
        return self::where(['id'=>$id, 'status'=>4])->update(['status'=>3, 'overdue_repay_time'=>time()]);
    }

    /**
     * 获取逾期未还的还款数据
     */
    public function getOverdueDataAfterId($id)
    {
        $result = self::where(['status'=>4])->where('id', '>', $id)->lockForUpdate()->orderBy('id', 'ASC')->first();
        if($result) {
            return $result->original;
        }
        return NULL;
    }

    /**
     * 设置还款数据为逾期还款
     */
    public function setOverdueRepay($id)
    {
        return self::where(['id'=>$id, 'status'=>4])->update(['status'=>3, 'overdue_repay_time'=>time()]);
    }

    /**
     * 设置借款人还款数据为还款异常
     */
    public function setRepayAbnormal($id)
    {
        return self::where(['id'=>$id])->update(['working_status'=>1]);
    }

    /**
     * 设置借款人某一期的还款数据为还款异常
     */
    public function setRepayAbnormalOfPeriod($pid, $period)
    {
        return self::where(['pid'=>$pid, 'period'=>$period])->update(['working_status'=>1]);
    }

    /**
     * 通过标的ID和期数号获取借款人还款数据ID
     */
    public function getIdByPidAndPeriod($pid, $period)
    {
        $id = 0;
        if($pid && $period && ($result = self::where(['pid'=>$pid, 'period'=>$period])->first())) {
            $id = $result->id;
        }
        return $id;
    }

    //某个项目(散标)逾期次数
    public function overdueTimes($project_id)
    {
        $sql  = "select 
                count(id) as overdue_times
                from borrower_repay where pid = ? 
                and status in(3,4)";
        $data = DB::select($sql, [$project_id]);
        return $data[0];
    }

    //某个项目(散标)最大逾期天数
    public function overdueMaxTime($project_id)
    {
        $sql = "select 
                max(overdue_day) as overdue_max_time
                from borrower_repay 
                where pid = ? 
                and status in(3,4) ";

        $data = DB::select($sql, [$project_id]);
        return $data[0];
    }

    //通过合标id获取其包含的散标id
    public function getSingleProjectIds($project_id)
    {
        $sql = "select id 
                from project 
                where merge_id = ?
                and type=1";

        return DB::select($sql, [$project_id]);
    }

    //获取合标的逾期次数
    public function overdueTimesOfUnion($ids)
    {
        $sql = "select count(id) as num
                from borrower_repay 
                where pid in (?)
                and (status = 3 or status = 4)";

        $data = DB::select($sql, [$ids]);
        return $data[0];
    }

    //最大逾期次数
    public function overdueMaxTimeOfUnion($ids)
    {
        $sql = "select max(overdue_day) as max
                from borrower_repay 
                where pid in (?)
                and (status = 3 or status =4)";

        $data = DB::select($sql, [$ids]);
        return $data[0];
    }


    /**
     * 获取产品未还剩余期数
     */
    public function getSurplusPeriods($pid)
    {
        return self::where(['pid' => $pid])->where('status', 'in', [1, 4])->count();
    }

    /**
     * 获取预期提前还款期数
     */
    public function overdueCount($pid)
    {
        $overdue_count = DB::table($this->table)->where('pid',$pid)->where('status','3')->count();
        $count = DB::table($this->table)->where('pid',$pid)->count();
        if($overdue_count == $count){
            return false;
        }else{
            return true;
        }
    }

    /**
     *  获取剩余期数（应还日期与当前时间对比）
     */
    public function surplusTerm($pid,$date)
    {
        $data = DB::table($this->table)
              -> where('pid',$pid)
              -> where('repay_time','>',$date)
              -> count();
        return $data;
    }

    //获取剩余期数(散标)
    public function getLeftTerms($pid)
    {
        $sql = 'select count(id) as left_terms from 
                borrower_repay where pid = ? and 
                repay_time > unix_timestamp(now())';

        $res = DB::select($sql, [$pid]);
        return $res[0]->left_terms;
    }
}