<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use phpDocumentor\Reflection\Types\Null_;

class LenderInvest extends Model
{
    protected $table = 'lender_invest';
    const STATUS_PROJECT_LIUBIAO = 4; //流标
    const STATUS_HUIKUAN_YIHUAN  = 2; //已还
    const STATUS_HUIKUAN_WEIHUAN = 1; //未还

    //投资记录出借中
    public function jiluChujiezhong($uid, $p, $c)
    {

        return DB::table('lender_invest')
            ->selectRaw('lender_payment.id, lender_invest.sign_status, lender_invest.id as chujie_jilu_id, project.title, lender_payment.amt, date_format(lender_invest.created_at, "%Y-%m-%d") as chujie, from_unixtime(lender_payment.repay_time, "%Y-%m-%d") as huikuan, lender_payment.status as is_huikuan, project.status, lender_invest.rate, lender_invest.tw_contract_id, lender_invest.local_contract_id')
            ->join('project', 'project.id', 'lender_invest.pid')
            ->join('lender_payment', 'lender_payment.id', 'lender_invest.pay_id')
            ->where('lender_payment.uid', $uid)
            ->Where('project.status', '<>', SELF::STATUS_PROJECT_LIUBIAO)
            ->where('lender_payment.status', SELF::STATUS_HUIKUAN_WEIHUAN)
            ->orderBy('lender_invest.id', 'desc')
            ->offset(($p - 1) * $c)
            ->limit($c)
            ->get()
            ->toArray();
    }

    //投资记录已结清
    public function jiluYijieqing($uid, $p, $c)
    {
        return DB::table('lender_invest')
            ->selectRaw('lender_payment.id, lender_invest.sign_status, lender_invest.id as chujie_jilu_id, project.title, lender_payment.amt, date_format(lender_invest.created_at, "%Y-%m-%d") as chujie, from_unixtime(lender_payment.repay_time, "%Y-%m-%d") as huikuan, lender_payment.status as is_huikuan, project.status, lender_invest.rate, lender_invest.tw_contract_id, lender_invest.local_contract_id')
            ->join('project', 'project.id', 'lender_invest.pid')
            ->join('lender_payment', 'lender_payment.id', 'lender_invest.pay_id')
            ->where('lender_payment.uid', $uid)
            ->Where('project.status', '<>', SELF::STATUS_PROJECT_LIUBIAO)
            ->where('lender_payment.status', SELF::STATUS_HUIKUAN_YIHUAN)
            ->orderBy('lender_invest.id', 'desc')
            ->offset(($p - 1) * $c)
            ->limit($c)
            ->get()
            ->toArray();
    }

    //全部投资记录
    public function jiluAll($uid, $p, $c)
    {
        return DB::table('lender_invest')
            ->selectRaw('lender_payment.id, lender_invest.sign_status, lender_invest.id as chujie_jilu_id, project.title, lender_payment.amt, date_format(lender_invest.created_at, "%Y-%m-%d") as chujie, from_unixtime(lender_payment.repay_time, "%Y-%m-%d") as huikuan, lender_payment.status as is_huikuan, project.status, lender_invest.rate, lender_invest.tw_contract_id, lender_invest.local_contract_id')
            ->join('project', 'project.id', 'lender_invest.pid')
            ->join('lender_payment', 'lender_payment.id', 'lender_invest.pay_id')
            ->where('lender_payment.uid', $uid)
            ->orderBy('lender_invest.id', 'desc')
            ->offset(($p - 1) * $c)
            ->limit($c)
            ->get()
            ->toArray();
    }

    /**
     * 投资新增投资记录
     */
    public function investAddData($uid, $pid, $amt, $rate, $payId, $serialNum='', $ppid=0, $surplusPeriods)
    {
        return DB::table($this->table)->insertGetId([
            'serial_num' => $serialNum,
            'uid'    => $uid,
            'pid'    => $pid,
            'ppid'   => $ppid,
            'amt'    => $amt,
            'rate'   => $rate,
            'pay_id' => $payId,
            'surplus_periods'   => $surplusPeriods
        ]);
    }

    /**
     * 获取投资记录
     */
    public function getInvestDataById($id)
    {
        $investData = [];
        if ($id && ($investData = self::where(['id' => $id])->first())) {
            $investData = $investData->original;
        }
        return $investData;
    }

    //理财端首页显示的投资记录
    public function touziJiluHistory()
    {
        return DB::table('lender_invest')
            ->join('users', 'users.id', 'lender_invest.uid')
            ->join('project', 'project.id', 'lender_invest.pid')
            ->selectRaw('users.mobile, date_format(lender_invest.created_at, "%c/%d") as day, lender_invest.amt')
            ->where('project.display', '=', '1')
            ->orderBy('lender_invest.created_at', 'desc')
            ->limit('20')
            ->get();
    }

    /**
     * 保存天威合同编号
     */
    public function saveTwContractId($id, $tw_contract_id, $local_contract_id)
    {
        $lenderInvestData = self::where(['id' => $id])->first();
        if ($lenderInvestData) {
            $lenderInvestData->tw_contract_id    = $tw_contract_id;
            $lenderInvestData->local_contract_id = $local_contract_id;
            $lenderInvestData->save();
        }
        return true;
    }

    /**
     * 获取该项目的投资记录
     */
    public function projectRecord($project_id)
    {
        $data = DB::table($this->table)->where('pid', '=', $project_id)->orderBy('created_at', 'desc')->get();
        return $data;
    }

    //是否投资
    public function isTouzi($uid)
    {
        $res = DB::table('lender_invest')
            ->where('uid', $uid)
            ->first();

        return empty($res) ? 0 : 1;
    }

    //待收本金
    public function daishou_benjin($uid)
    {
        $data = DB::table('lender_invest')
            ->join('project', 'project.id', 'lender_invest.pid')
            ->join('lender_payment', 'lender_payment.id', 'lender_invest.pay_id')
            ->selectRaw('sum(lender_invest.amt) as daishou')
            ->where('lender_invest.uid', $uid)
            ->whereRaw('project.status in (5,6) and lender_invest.debt_status in (0,1) and lender_payment.status in (1,4) ')
            ->get()
            ->toArray();
        return $data[0];
    }

    //锁定资金
    public function suoding_zijin($uid)
    {
        $data = DB::table('lender_invest')
            ->join('project', 'project.id', 'lender_invest.pid')
            ->join('lender_payment', 'lender_payment.id', 'lender_invest.pay_id')
            ->selectRaw('sum(lender_invest.amt) as suoding')
            ->where('lender_invest.uid', $uid)
            ->whereRaw('project.status in (2,3,4)')
            ->where('lender_payment.status', 1)
            ->get()
            ->toArray();
        return $data[0];
    }

    /**
     * 设置签约状态为已签约
     */
    public function setSignStatus($investId)
    {
        if ($investId && ($lenderInvestData = self::where(['id' => $investId])->first())) {
            $lenderInvestData->sign_status = 1;
            $lenderInvestData->save();
        }
        return true;
    }

    /**
     * 获取流标的投资记录
     */
    public function getLossInvestData($pid)
    {
        $result           = self::where(['pid' => $pid, 'amt_return' => 0])->lockForUpdate()->get();
        $lenderInvestData = [];
        foreach ($result as $val) {
            $lenderInvestData[] = $val->original;
        }

        return $lenderInvestData;
    }

    /**
     * 设置投资的流标状态为已回退
     */
    public function setLossInvest($id)
    {
        return self::where(['id' => $id])->update(['amt_return' => 1]);
    }

    /**
     * 判断借款人是否有未结束的借款
     */
    public function conductInvestment($uid)
    {
        $sql  = "select * from lender_invest as l LEFT JOIN lender_payment as p ON l.pay_id = p.id WHERE l.uid = $uid AND p.status IN (1,4)";
        $data = DB::select($sql);
        if (!empty($data)) {
            return false;
        } else {
            return true;
        }
    }

    //根据出借编号判断是否是合标
    public function isMerge($uid, $lender_num)
    {
        return DB::table('lender_invest')
            ->where('uid', $uid)
            ->where('serial_num', $lender_num)
            ->value('ppid');
    }

    /**
     * 债转列表
     */
    public function debtList($p, $c, $rate, $term)
    {
        if (empty($term) && empty($rate)) {
            $order = "updated_at";
            $type = "DESC";
        } elseif (!empty($rate)) {
            $order = "rate";
            $type = $rate;
        } elseif (!empty($term)) {
            $order = "term";
            $type = $term;
        }
        $data = DB::table($this->table)
              ->join('project','project.id','lender_invest.pid')
              ->select(DB::raw('lender_invest.serial_num,max(lender_invest.debt_no) as debt_no ,max(lender_invest.pid) as pid, max(lender_invest.ppid) as ppid, sum(lender_invest.amt) as amt, max(lender_invest.rate) as rate,max(lender_invest.surplus_periods) as term,max(lender_invest.debt_status) as debt_status ,max(lender_invest.updated_at) as updated_at,MAX(project.display) as display'))
              ->whereIn('debt_status',[1,2])
              ->where('display','1')
              ->groupBy('serial_num')
              ->orderBy($order, $type)
              ->offset(($p - 1) * $c)
              ->limit($c)
              ->get()
              ->toArray();
        return $data;
    }

    //获取出借的产品id
    public function getPidOrPpid($lender_num)
    {
        $sql = "select 
            pid, ppid, debt_status, created_at 
            from lender_invest 
            where serial_num = ? 
            limit 1";

        $data = DB::select($sql, [$lender_num]);
        return $data[0];
    }

    /**
     * 4.1.0 获取用户出借记录（合并标/散标/债转）
     */
    public function getLendList($uid,$p,$c)
    {
        exit('停用');
        //title  标题   project_status 产品状态   lender_time 出借日期  amt 出借金额  sign_status 签约状态  debt_status：债转状态   payment_status:回款状态  repay_time 回款时间
        $data = DB::table($this->table)
            ->join('project','lender_invest.pid','project.id')
            ->join('lender_payment','lender_invest.pay_id','lender_payment.id')
            ->selectRaw('lender_invest.serial_num,MAX(lender_invest.pid) AS pid,MAX(lender_invest.ppid) AS ppid,MAX(project.title) AS title ,MAX(project.status) AS project_status,MAX(lender_invest.created_at) AS lender_time,SUM(lender_invest.amt) AS amt,MAX(lender_invest.sign_status) AS sign_status,MAX(lender_invest.debt_status) AS debt_status ,MAX(lender_payment.status) AS payment_status,MAX(lender_payment.repay_time) AS repayment_time ')
            ->where('lender_invest.uid',$uid)
            ->groupBy('serial_num')
            ->orderBy('lender_time','DESC')
            ->get()
            ->toArray();
        return $data;
    }

    public function LendList($uid)
    {
        //title  标题   project_status 产品状态   lender_time 出借日期  amt 出借金额  sign_status 签约状态  debt_status：债转状态   payment_status:回款状态  repay_time 回款时间
        $data = DB::table($this->table)
            ->join('project','lender_invest.pid','project.id')
            ->join('lender_payment','lender_invest.pay_id','lender_payment.id')
            ->selectRaw('MAX(lender_invest.id) as invest_id ,lender_invest.serial_num,MAX(lender_invest.pid) AS pid,MAX(lender_invest.ppid) AS ppid,MAX(project.title) AS title ,MAX(project.status) AS project_status,MAX(lender_payment.status) as payment_status ,MAX(lender_invest.created_at) AS lender_time,SUM(lender_invest.amt) AS amt,MAX(lender_invest.sign_status) AS sign_status,MAX(lender_invest.debt_status) AS debt_status ,MAX(lender_payment.status) AS payment_status,MAX(lender_payment.repay_time) AS repayment_time,MAX(lender_payment.debt_repay_time) as debt_repay_time ')
            ->where('lender_invest.uid',$uid)
            ->groupBy('serial_num')
            ->orderBy('lender_time','DESC')
            ->get()
            ->toArray();
        return $data;
    }

    /**
     * 4.1.0更新标的产品的剩余期数
     */
    public function updateSurplusPeriods($pid, $surplusPeriods)
    {
        return self::where(['pid'=>$pid])->update(['surplus_periods'=>$surplusPeriods]);
    }

    //出借记录 (根据出借编号获取)
    public function lenderInvestList($loan_num,$status)
    {
        if($status == 0){
            $sql = 'select l.id, l.serial_num, l.debt_no, l.uid, l.pid, l.ppid, l.pay_id, l.amt, l.rate, l.debt_status, l.surplus_periods, 
                l.debt_periods, p.repay_time, p.id as pay_id, j.basis_rate, j.extra_rate, j.type, p.profit
                from lender_invest l 
                join lender_payment p on l.pay_id=p.id 
                join project j on j.id = l.pid
                where l.serial_num = ? and 
                l.debt_status = 0';
            return DB::select($sql, [$loan_num]);
        }
        if($status == 1){
            $sql = 'select l.id, l.serial_num, l.debt_no, l.uid, l.pid, l.ppid, l.pay_id, l.amt, l.rate, l.debt_status, l.surplus_periods, 
                l.debt_periods, p.repay_time, p.id as pay_id, j.basis_rate, j.extra_rate, j.type, p.profit
                from lender_invest l 
                join lender_payment p on l.pay_id=p.id 
                join project j on j.id = l.pid
                where l.serial_num = ? and
                l.debt_status = 1';
            return DB::select($sql, [$loan_num]);
        }
    }

    //一条投资记录信息
    public function oneLenderRecord($loan_num)
    {
        $sql = 'select p.lock_day, UNIX_TIMESTAMP(l.created_at) as created_at, p.full_scale_time
                from lender_invest l join 
                project p on l.pid = p.id 
                where serial_num = ? and 
                debt_status = 1 
                limit 1';

        $data = DB::select($sql, [$loan_num]);
        return $data[0];
    }

    //债转时跟新lender_invest表
    public function updateDebt($loan_num, $debt_no, $left_terms)
    {
        $sql = 'update lender_invest 
                set debt_no = ?, 
                debt_status = ?, 
                debt_periods = ?
                where serial_num = ? and debt_status = 1';

        return DB::update($sql, [$debt_no, '2', $left_terms, $loan_num]);
    }

    //债转时向lender_invest表添加数据
    public function addDebtInvest($v, $loan_num_new, $debt_no, $uid, $left_terms)
    {
        $sql = 'insert into lender_invest 
                (serial_num, debt_no, uid, pid, ppid, amt, rate, debt_status, surplus_periods, debt_periods) value 
                (?, ? ,?, ?, ? ,?, ?, 0, ?, ?)';

        $res = DB::insert($sql, [$loan_num_new, $debt_no, $uid, $v->pid, $v->ppid, $v->amt, $v->rate, $left_terms, $left_terms]);
        if($res)
        {
            $data = DB::select('select LAST_INSERT_ID() as id');
            return $data[0];
        }else
        {
            return 0;
        }
    }

    //跟新lender_invest表的pay_id字段
    public function updateDebtPayId($lender_invest_id, $lender_payment_id)
    {
        $sql = 'update lender_invest 
                set pay_id = ? where 
                id = ? and debt_status = 0';

        return DB::update($sql, [$lender_payment_id, $lender_invest_id]);
    }

    /**
     * 4.1.0  出借详情
     */
    public function serial_lender($serial_num)
    {
       $data = DB::table($this->table)
             ->join('lender_payment','lender_invest.pay_id','lender_payment.id')
             ->join('project','lender_invest.pid','project.id')
             ->selectRaw('MAX(lender_invest.id) as invest_id ,MAX(lender_invest.serial_num) as serial_num , MAX(debt_no) as debt_no , MAX(project.title) as title ,sum(lender_payment.profit) as profit,sum(lender_payment.amt) as amt,MAX(lender_invest.rate) as rate,MAX(lender_invest.sign_status) as sign_status ,MAX(project.status) as project_status,MAX(lender_payment.status) as payment_status, MAX(project.loan_term) as term,MIN(surplus_periods) as surplus_periods,MAX(lender_invest.created_at) as lend_time,MAX(lender_payment.repay_time) as repay_time,MAX(lender_invest.debt_status) as debt_status,MAX(lender_payment.debt_repay_time) as debt_repay_time,MAX(lender_invest.ppid) as ppid,MAX(lender_invest.pid) as pid,MAX(project.full_scale_time) as qixiri')
             ->where('lender_invest.serial_num',$serial_num)
             ->first();
        if (empty($data->invest_id)){
           $data = array();
       }
        Log::info(__FUNCTION__.'>'.__LINE__.' data = ',$data);
        return $data;
    }

    //出借的总金额 债转前
    public function lenderAmount($loan_num)
    {
        $sql = 'select sum(amt) as amt_all
                from lender_invest 
                where serial_num = ? and 
                debt_status = 1';

        $data = DB::select($sql, [$loan_num]);
        return $data[0];
    }

    /**
     * 4.1.0 合标合同列表
     */
    public function mergeContractList($serial_num,$p,$c)
    {
        $data = DB::table($this->table)
            ->join('project','lender_invest.pid','project.id')
            ->selectRaw('lender_invest.id as invest_id ,project.title,lender_invest.sign_status,lender_invest.tw_contract_id,lender_invest.amt,lender_invest.rate,lender_invest.pid')
            ->where('lender_invest.serial_num',$serial_num)
            ->offset(($p - 1) * $c)
            ->limit($c)
            ->get()
            ->toArray();
        return $data;
    }

    /**
     * 4.1.0 合并标投资记录
     */
    public function mergerLenderList($pid,$p,$c)
    {
        $data = DB::table($this->table)
            ->selectRaw('MAX(created_at) as created_at,sum(amt) as amt,MAX(uid) as uid')
            -> where('ppid',$pid)
            ->where('debt_status','0')
            -> groupBy('serial_num')
            ->orderBy('created_at','desc')
            ->offset(($p - 1) * $c)
            ->limit($c)
            -> get()
            -> toArray();
        return $data;
    }

    /**
     * 4.1.0 散标投资记录
     */
    public function projectLenderList($pid,$p,$c)
    {
        $data = DB::table($this->table)
            ->where('pid', '=', $pid)
            ->where('debt_status','0')
            ->selectRaw('amt,created_at,uid')
            ->orderBy('created_at', 'desc')
            ->offset(($p - 1) * $c)
            ->limit($c)
            ->get()
            ->toArray();
        return $data;
    }

    /**
     * 获取单笔投资的记录集合
     */
    public function getInvestArrBySerialNum($serial_num){
        $data = self::select("id","sign_status")
            ->where('serial_num',$serial_num)
            ->get()
            ->toArray();
        return $data;
    }

    //剩余期数 债转前
    public function leftTermsBeforeDebt($loan_num)
    {
        $sql = 'select max(surplus_periods) as left_terms 
                from lender_invest where 
                serial_num = ? and 
                debt_status = 0';

        $data = DB::select($sql, [$loan_num]);
        return $data[0];
    }

    //出借的总金额 债转后
    public function lenderAmountBeforeDebt($loan_num)
    {
        $sql = 'select sum(amt) as amt_all
                from lender_invest 
                where serial_num = ? and 
                debt_status = 0';

        $data = DB::select($sql, [$loan_num]);
        return $data[0];
    }

    /**
     * 4.1.0 理财端轮播投资记录
     */
    public function homeLendRecord()
    {
        $data = DB::table($this->table)
            ->join('users', 'users.id', 'lender_invest.uid')
            ->join('project','project.id','lender_invest.pid')
            ->where('project.display','1')
            ->selectRaw('SUM(amt) as amt,date_format(MAX(lender_invest.created_at), "%c/%d") as day,MAX(mobile) as mobile,MAX(ppid) as ppid ,MAX(pid) as pid')
            ->groupBy('serial_num')
            ->limit('20')
            ->get()
            ->toArray();
        return $data;
    }

}