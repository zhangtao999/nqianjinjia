<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class LenderPayment extends Model
{
    const STATUS_YIHUIKUAN  = 2; //1:未回款 2:已回款
    const STATUS_WEIHUIKUAN = 1; //1:未回款 2:已回款
    protected $table = 'lender_payment';

    //本月应该回款数
    public function yinggai($date, $uid)
    {
        $sql = "select sum(amt+profit) as sum 
                from lender_payment where 
                from_unixtime(repay_time, '%Y%m') = ? and uid = ? 
                and status in(1,2,4)";
        $sum = DB::select($sql, [$date, $uid]);

        return $sum;
    }

    //本月已经回款数
    public function yijing($date, $uid)
    {
        $sql = "select sum(amt+profit) as sum from lender_payment where 
                from_unixtime(repay_time, '%Y%m') = ? and 
                status =2 and uid = ?";
        $sum = DB::select($sql, [$date, $uid]);

        return $sum;
    }

    public function yijingDebt($date, $uid)
    {
        $sql = "select sum(amt+actual_profit-lock_commission_charge) as sum from lender_payment where 
                from_unixtime(repay_time, '%Y%m') = ? and 
                status = 5 and uid = ?";
        $sum = DB::select($sql, [$date, $uid]);

        return $sum;
    }

    //当日回款记录
    public function dayJilu($date, $uid)
    {
        $sql = "select lender_payment.status, lender_invest.id, 
                from_unixtime(lender_payment.repay_time, '%Y-%m-%d') as time, 
                (lender_payment.amt+lender_payment.profit) as money, lender_payment.amt, lender_payment.profit, 
                (lender_payment.actual_profit + lender_payment.amt - lock_commission_charge) as debt_money, 
                DATE_FORMAT(lender_payment.created_at, '%Y-%m-%d') as debt_time, 
                lender_invest.serial_num, project.merge_id, project.id as project_id, lender_invest.debt_status, 
                project.title from 
                lender_invest left join 
                lender_payment on lender_payment.id=lender_invest.pay_id left join 
                project on project.id=lender_invest.pid 
                where from_unixtime(lender_payment.repay_time, '%Y%m%d') = ? and 
                lender_invest.uid = ? and 
                lender_payment.status in (1,2,4,5)";
        return DB::select($sql, [$date, $uid]);

    }


    //月回款记录
    public function monthReceive($date, $uid)
    {
        $sql = "select lender_payment.status, lender_invest.id, 
                from_unixtime(lender_payment.repay_time, '%Y-%m-%d') as time, 
                (lender_payment.amt+lender_payment.profit) as money, 
                (lender_payment.actual_profit + lender_payment.amt - lock_commission_charge) as debt_money, 
                DATE_FORMAT(lender_payment.created_at, '%Y-%m-%d') as debt_time, 
                lender_invest.serial_num, project.merge_id, project.id as project_id, lender_invest.debt_status, 
                project.title from lender_invest 
                left join 
                lender_payment on lender_payment.id=lender_invest.pay_id 
                left join project on project.id=lender_invest.pid where 
                from_unixtime(lender_payment.repay_time, '%Y%m') = ? and 
                lender_invest.uid = ? and 
                lender_payment.status in (1,2,4,5)";
        $sum = DB::select($sql, [$date, $uid]);

        return $sum;
    }

    //一个月有回款记录的日期
    public function dayHasReceive($date, $uid)
    {
        $sql = "select from_unixtime(repay_time, '%e') as day from lender_payment where from_unixtime(repay_time, '%Y%m') = ? and uid = ?";

        $sum = DB::select($sql, [$date, $uid]);

        return $sum;
    }

    /**
     * 投资新增回款记录
     */
    public function investAddData($uid, $pid, $amt, $profit, $serialNum='')
    {
        return DB::table($this->table)->insertGetId([
            'uid'    => $uid,
            'pid'    => $pid,
            'amt'    => $amt,
            'profit' => $profit,
            'status' => 1,
            'serial_num'    => $serialNum
        ]);
    }

    //出借详情
    public function chujieDetail($id)
    {
        $sql = "select lender_invest.sign_status, lender_invest.tw_contract_id, lender_invest.local_contract_id, lender_payment.amt, lender_payment.status as is_huikuan, date_format(lender_payment.created_at, '%Y-%m-%d') as chujieri, lender_payment.profit, project.title, project.basis_rate, project.extra_rate, from_unixtime(project.full_scale_time+60*60*24, '%Y-%m-%d') as qixiri, from_unixtime(lender_payment.repay_time, '%Y-%m-%d') as repay_time, project.id, project.status from lender_invest left join lender_payment on lender_payment.id=lender_invest.pay_id left join project on project.id=lender_invest.pid where lender_invest.id = ? limit 1";

        $data = DB::select($sql, [$id]);

        return $data;
    }

    //利息(已结算收益)
    public function liXi($uid)
    {
        $data = DB::table('lender_payment')
            ->join('project', 'project.id', 'lender_payment.pid')
            ->selectRaw('sum(lender_payment.profit) as lixi')
            ->where('lender_payment.uid', $uid)
            ->where('lender_payment.status', '2')
            ->whereRaw('project.status <> 4')
            ->get()
            ->toArray();

        return $data[0];
    }

    //未结算收益
    public function lixiWeijiesuan($uid)
    {
        $data = DB::table('lender_payment')
            ->join('project', 'project.id', 'lender_payment.pid')
            ->selectRaw('sum(lender_payment.profit) as lixi')
            ->where('lender_payment.uid', $uid)
            ->where('lender_payment.status', '1')
            ->whereRaw('project.status <> 4')
            ->get()
            ->toArray();

        return $data[0];
    }

    /**
     * 设置回款记录的状态为流标
     */
    public function setProjectLoss($pid)
    {
        return self::where(['pid'=>$pid])->update(['status'=>3]);
    }

    /**
     * 4.1.0 累计收益
     */
    public function leijiProfit($uid)
    {
        //正常回款
        $profit = DB::table('lender_payment')
            ->join('project', 'project.id', 'lender_payment.pid')
            ->selectRaw('sum(lender_payment.profit) as profit')
            ->where('lender_payment.uid', $uid)
            ->where('lender_payment.status', '2')
            ->whereRaw('project.status <> 4')
            ->first();
        $actual_profit = DB::table('lender_payment')
            ->join('project', 'project.id', 'lender_payment.pid')
            ->selectRaw('sum(lender_payment.actual_profit) as actual_profit')
            ->where('lender_payment.uid', $uid)
            ->where('lender_payment.status', '4')
            ->whereRaw('project.status <> 4')
            ->first();
        $profit_sum = $profit->profit + $actual_profit->actual_profit;
        return $profit_sum;
    }

    //债权转让, 跟新lender_payment表(在锁定期)
    public function updateDebtInLock($left_terms, $all_terms, $lock_commission_rate, $loan_num)
    {
        $sql = 'update lender_payment 
                set actual_profit = floor((profit*(?-?)/?)), 
                lock_commission_charge = floor(?/10000*amt), 
                status = 5, 
                debt_repay_time = '.time().' 
                where serial_num = ? and 
                status = 4';
        return DB::update($sql, [$all_terms, $left_terms, $all_terms, $lock_commission_rate, $loan_num]);

    }

    //债权转让, 跟新lender_payment表(不在锁定期)
    public function updateDebtNotLock($left_terms, $all_terms, $loan_num)
    {
        $sql = 'update lender_payment 
                set actual_profit = floor(profit*(?-?)/?), 
                lock_commission_charge = 0, 
                status = 5, 
                debt_repay_time = '.time().' 
                where serial_num = ? and 
                status = 4';
        return DB::update($sql, [$all_terms, $left_terms, $all_terms, $loan_num]);
    }

    //添加lender_payment表数据
    public function addLenderPayment($v, $uid, $loan_num_new, $left_terms, $all_terms, $repay_time)
    {
        $profit = ($left_terms) / 12 * ($v->amt) * ($v->rate) / 10000;
        $profit = round($profit);
        $sql    = 'insert into lender_payment 
                (uid, serial_num, pid, amt, profit, status, repay_time) value 
                (?, ?, ?, ?, ?, ?, ?)';

        $res = DB::insert($sql, [$uid, $loan_num_new, $v->pid, $v->amt, $profit, 1, $repay_time]);
        if($res)
        {
            $data = DB::select('select LAST_INSERT_ID() as id');
            return $data[0];
        }else
        {
            return 0;
        }
    }

    //原本应得利息(不债转)
    public function lenderAllProfit($loan_num)
    {
        $sql = 'select sum(profit) as profit
                from lender_payment 
                where serial_num = ? and 
                status = 4';

        $data = DB::select($sql, [$loan_num]);

        return $data[0];
    }


}
