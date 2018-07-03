<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Service;

use App\Model\Borrower;
use App\Model\BorrowerFundRecord;
use App\Model\BorrowerRepay;
use App\Model\FundFreezeRecord;
use App\Model\LenderEveryPayment;
use App\Model\LenderInvest;
use App\Model\Project;
use App\Model\LoanApplyProject;
use App\Model\LoanApply;
use App\Model\FyAccount;
use App\Fuiou\Fuiou;
use App\Model\FyFundRecord;
use App\Model\AutoRepayLog;
use App\Model\Users;
use App\Model\WorkingAbnormal;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class BorrowerRepayService
{

    const PROJECT_DATA_NULL = '产品数据为空';
    const LOAN_APPLY_DATA_NULL = '借款申请数据为空';
    const PROJECT_RATE_ERROR = '产品利率不正确';
    const LOAN_AMOUNT_ERROR = '借款金额不正确';
    const LOAN_TERM_ERROR = '借款期限不正确';
    const GRANT_TIME_ERROR = '放款时间未设置';
    const ADD_BORROWER_REPAY_FAIL = '新增借款人还款记录失败';
    const SAVE_BORROWER_REPAY_FAIL = '设置借款人还款记录为已还款失败';
    const BORROWER_NOREPAY_DATA_NULL = '未还款的数据为空';
    const NO_REPAY_CORPUS_ERROR = '未还款的本金不正确';
    const TRANSFER_FUND_FAIL = '用户余额划拨失败';
    const TRANSFER_ACCOUNTS_FAIL = '用户余额转账失败';
    const NO_REPAY_DATA_NULL = '当天需要还款的数据为空';
    const WABAO_ACCOUNT_ABNORMAL = '挖宝平台法人账户异常';
    const WABAO_PLATFORM_ABNORMAL = '挖宝平台账户异常';
    const AUTO_TRANSFER_FAIL = '自动还款划拨失败';
    const AUTO_TRANSFER_ACCOUNT_FAIL = '自动还款转账失败';
    const AUTO_REPAY_FAIL = '自动还款失败';
    const FY_BANK_CARD_TRANSFER_FAIL = '富友银行卡支付代扣失败';
    const SET_EARLY_REPAY_TIME_FAIL = '设置提前还款时间失败';
    const ADD_TRANSFER_FAIL = '增加划拨记录失败';
    const SET_REPAY_DATA_REPAID_FAIL = '设置还款计划为正常还款失败';
    const ADD_FY_FUND_RECORD_FAIL = '增加富友资金记录失败';
    const ADD_AUTO_REPAY_LOG_FAIL = '增加自动还款日志失败';
    const BANK_WITHHOLD_FAIL = '银行卡代扣失败';
    const ADD_BORROWER_FUND_RECORD_FAIL = '增加借款人资金记录失败';
    const SET_REPAY_FINISH_FAIL = '设置产品还款结束失败';
    const SET_REPAY_DATA_OVERDUE_FAIL = '设置还款记录为逾期未还款失败';
    const SET_LOAN_APPLY_FINISH_FAIL = '设置借款申请为已完成失败';
    const LENDER_EVERY_PAYMENT_DATA_NULL = '出借人回款数据为空';
    const SET_FREEZE_FAIL = '设置划拨预冻结失败';
    const FUND_FREEZE_RECORD_ADD_FAIL = '增加划拨预冻结记录数据';
    const LENDER_FUND_FREEZE_FAIL = '出借人资金划拨预冻结失败';
    const BORROWER_FUND_FREEZE_FAIL = '借款人资金冻结失败';
    const ADD_BORROWER_FREEZE_DATA_FAIL = '增加借款人资金冻结记录失败';
    const MERGE_PROJECT_NO_DATA = '合并标没有散标数据';
    const UPDATE_SURPLUS_PERIODS_FAIL = '更新出借记录的剩余期数失败';
    const UPDATE_NO_REPAY_MONEY = '更新借款人待还金额失败';

    private $borrowerRepay;
    private $pid;
    private $project;
    private $projectData;
    private $errorMessage;
    private $loanApplyProject;
    private $loanApply;
    private $loanApplyData;
    private $eachInterest;
    private $aid;
    private $uid;
    private $allCorpus;
    private $fyAccount;
    private $fuiou;
    private $fyFundRecord;
    private $autoRepayLog;
    private $verify_code;
    private $mchnt_txn_ssn;
    private $noRepayData;
    private $borrowerFundTransfer;
    private $autoRepayLogRemark;
    private $loanApplyId;
    private $anotherInterest;
    private $users;
    private $lenderEveryPayment;
    private $fundFreezeRecord;
    private $abnormalUid;
    private $workingAbnormal;
    private $borrowerFreezeSerialNum;
    private $pids;
    private $lenderInvest;
    private $borrower;

    public function __construct()
    {
        $this->borrowerRepay = new BorrowerRepay();
        $this->project = new Project();
        $this->loanApplyProject = new LoanApplyProject();
        $this->loanApply = new LoanApply();
        $this->fyAccount = new FyAccount();
        $this->fuiou = new Fuiou();
        $this->fyFundRecord = new FyFundRecord();
        $this->autoRepayLog = new AutoRepayLog();
        $this->borrowerFundTransfer = new BorrowerFundRecord();
        $this->users = new Users();
        $this->lenderEveryPayment = new LenderEveryPayment();
        $this->fundFreezeRecord = new FundFreezeRecord();
        $this->workingAbnormal = new WorkingAbnormal();
        $this->lenderInvest = new LenderInvest();
        $this->borrower = new Borrower();
    }

    public function __set($name, $value)
    {
        $this->$name = $value;
    }

    public function __get($name)
    {
        return $this->$name;
    }

    /**
     * 创建散标的还款计划
     */
    public function createBorrowerRepayPlan()
    {

        Log::debug(__FILE__ .__FUNCTION__.__LINE__."createBorrowerRepayPlan start");
        // 获取产品数据
        if(true !== $this->getProjectData()) goto fail;
        // 计算每期的还款数据
        if(true !== $this->getRepayPlan()) goto fail;
        // 新增借款人还款记录数据
        if(true !== $this->addBorrowerRepayData()) goto fail;
        // 更新 借款人借款金额数据.=当前借款金额
        if(!$this->update_loan_amount()) goto fail;

        return true;
        fail:
            return $this->errorMessage;
    }

    /**
     * 创建合并标的还款计划
     */
    public function mergeProjectCreateBorrowerRepayPlan()
    {
        // 获取合并标下面的所有散标ID
        if(true !== $this->getPidsFromMergeProject()) goto fail;
        foreach ($this->pids as $this->pid) {
            // 获取产品数据
            if(true !== $this->getProjectData()) goto inside_fail;
            // 计算每期的还款数据
            if(true !== $this->getRepayPlan()) goto inside_fail;
            // 新增借款人还款记录数据
            if(true !== $this->addBorrowerRepayData()) goto inside_fail;
            inside_fail: {
                return $this->errorMessage;
            }
        }

        return true;
        fail: {
            return $this->errorMessage;
        }
    }

    /**
     * 获取合并标下面的所有散标ID
     */
    public function getPidsFromMergeProject()
    {
        $this->pids = $this->project->getPidsFromMergeProject($this->pid);
        if(!$this->pids) {
            return $this->errorMessage = self::MERGE_PROJECT_NO_DATA;
        }
        return true;
    }

    /**
     * 获取产品数据
     */
    public function getProjectData()
    {
        // 获取产品数据
        $this->projectData = $this->project->getProjectDataById($this->pid);
        if(!$this->projectData) {
            return $this->errorMessage = self::PROJECT_DATA_NULL;
        }

        // 获取借款申请数据
        $this->aid = $this->loanApplyProject->getAidByPid($this->pid);
        $this->loanApplyData = $this->loanApply->getDataById($this->aid);
        if(!$this->loanApplyData) {
            return $this->errorMessage = self::LOAN_APPLY_DATA_NULL;
        }

        return true;
    }

    /**
     * 计算每期的还款金额
     */
    public function getRepayPlan()
    {
        // 总借款金额
        $loanAmount = $this->projectData['loan_amount'];
        if($loanAmount < 0) {
            return $this->errorMessage = self::LOAN_AMOUNT_ERROR;
        }
        // 借款利率
        $allRate = $this->loanApplyData['rate'];
        if($allRate < 0) {
            return $this->errorMessage = self::PROJECT_RATE_ERROR;
        }
        // 借款期限
        $loanTerm = $this->projectData['loan_term'];
        if($loanTerm < 0) {
            return $this->errorMessage = self::LOAN_TERM_ERROR;
        }
        // 借款总利息
        $allInterest = $loanAmount * ($allRate/10000) * $loanTerm;
        // 每期还款利息，借款利息
        $this->eachInterest = round($allInterest/$loanTerm);

        return true;
    }

    //更新借款人总借款金额&待还金额
    public function update_loan_amount(){
        if(($uid=$this->loanApplyData['uid'])&&($lamt=$this->projectData['loan_amount'])){

            return DB::update('update borrower set loan_money=loan_money+?,no_repay_money =no_repay_money+? where uid=?',[$lamt,$lamt,$uid]);
        }
        Log::alert(__FUNCTION__.__LINE__.',update loan_apply amount error,there have no loanApplyData or ProjectData.');
        $this->errorMessage='更新借款人总借款金额&待还款金额失败。';
        return false;
    }
    /**
     * 新增借款人还款记录数据
     */
    public function addBorrowerRepayData()
    {
        $grant_time = $this->projectData['grant_time'] ? $this->projectData['grant_time'] : time();
        if(!$grant_time) {
            return $this->errorMessage = self::GRANT_TIME_ERROR;
        }else {
            $grant_time = strtotime(date('Y-m-d', $grant_time));
        }
        $batchData = [];
        $accCorpus = 0; // 累积本金
        for ($i=1; $i<=$this->projectData['loan_term']; $i++) {
            // 计算每期的本金，最后一期要补差之前的本金和
            if($i == $this->projectData['loan_term']) {
                $eachCorpus = $this->projectData['loan_amount'] - $accCorpus;
            }else {
                $eachCorpus = intval($this->projectData['loan_amount'] / $this->projectData['loan_term']);
                $accCorpus += $eachCorpus;
            }
            // 查询出借人每期回款总额
            $eachInvestInterest = $this->lenderEveryPayment->getProjectProfitOfPeriod($this->projectData['id'], $i);
            $data = [
                'uid'   => $this->loanApplyData['uid'],
                'pid'   => $this->pid,
                'lid'   => $this->loanApplyData['id'],
                'corpus'        => $eachCorpus,
                'interest'      => $this->eachInterest,
                'invest_interest'   => $eachInvestInterest,
                'period'        => $i,
                'status'        => 1,
                'repay_time'    => $this->calRepayDay($grant_time, $i)
            ];
            $batchData[] = $data;
        }
        if(true !== ($result = $this->borrowerRepay->batchAddBorrowerRepayData($this->pid, $batchData))) {
            if($result === false) {
                Log::alert(__FILE__ .__FUNCTION__.__LINE__."addBorrowerRepayData > batchAddBorrowerRepayData() error msg=".$result);
                return $this->errorMessage = self::ADD_BORROWER_REPAY_FAIL;
            }else {
                return $this->errorMessage = $result;
            }
        }

        return true;
    }


    /**
     * 计算每月还款日
     */
    public function calRepayDay($startTime, $monthNum)
    {
        $finalYear = $startYear = date('Y', $startTime);
        $startMonth = date('m', $startTime);
        $finalDay = $startDay = date('d', $startTime);
        if(($startMonth+$monthNum) > 12) {
            $yearSpan = floor(($startMonth+$monthNum)/12);
            $finalMonth = ($startMonth+$monthNum)%12;
            if($finalMonth == 0) {
                $finalMonth = 12;
                $finalYear += $yearSpan-1;
            }else {
                $finalYear += $yearSpan;
            }
        }else {
            $finalMonth = $startMonth+$monthNum;
        }
//        if (!function_exists('cal_days_in_month'))
//        {
//            function cal_days_in_month($calendar, $month, $year)
//            {
//                return date('t', mktime(0, 0, 0, $month, 1, $year));
//            }
//        }
        $lastDay = date('t', mktime(0, 0, 0, $finalMonth, 1, $finalYear)) ;//cal_days_in_month(0, $finalMonth, $finalYear);
        $finalDay = ($finalDay > $lastDay) ? $lastDay : $finalDay;
        return strtotime($finalYear.'-'.$finalMonth.'-'.$finalDay);
    }

    /**
     * 提前还款
     */
    public function earlyRepayment()
    {
        // 开启数据库事务
        DB::beginTransaction();
        // 获取未还款的还款计划数据和出借人剩余回款数据
        if(true !== $this->getBorrowerNoRepayData()) goto fail;
        // 设置还款计划数据为已还款
        if(true !== $this->setBorrowerNoRepayData()) goto fail;
        // 未还的本金之和划拨给挖宝账户
        if(true !== $this->earlyRepaymentAllCorpus()) goto fail;
        // 提交数据库事务
        DB::commit();

        return true;
        fail: {
            DB::rollback();
            return $this->errorMessage;
        }
    }

    /**
     * 获取未还款的还款计划数据和出借人的剩余回款数据
     */
    public function getBorrowerNoRepayData()
    {
        // 获取未还款的还款计划数据
        list($borrowerNoRepayData, $this->allCorpus, $this->loanApplyId, $this->anotherInterest) = $this->borrowerRepay->getBorrowerNoRepayData($this->uid, $this->pid);
        if(!$borrowerNoRepayData) {
            return $this->errorMessage = self::BORROWER_NOREPAY_DATA_NULL;
        }
        if(!$this->allCorpus) {
            return $this->errorMessage = self::NO_REPAY_CORPUS_ERROR;
        }

        return true;
    }

    /**
     * 未还的本金之和划拨给出借用户和平台户
     */
    public function earlyRepaymentAllCorpus()
    {
        // 快捷充值
        $data = [
            'txn_date' => date('Ymd'),
            'yzm' => $this->verify_code
        ];
        $fuiou = new Fuiou();
        $fuiou->quickRechargeApi();
        $fuiou->setMchntTxnSsn($this->mchnt_txn_ssn);
        $fuiou->request($data);
        $apiResult = $fuiou->response();
        if(!(isset($apiResult['msg']['resp_code']) && $apiResult['msg']['resp_code'] == '0000')) {
            if(!empty($apiResult['msg']['resp_desc'])) {
                $this->errorMessage = $apiResult['msg']['resp_desc'];
            }else {
                $this->errorMessage = self::FY_BANK_CARD_TRANSFER_FAIL;
            }
            return $this->errorMessage;
        }

        // 冻结借款人代扣的钱
        $amtFromMobile = $this->fyAccount->getMobileById($this->uid);
        $data = [
            'cust_no'  => $amtFromMobile,
            'amt'       => $this->allCorpus
        ];

        $fuiou = new Fuiou();
        $fuiou->freeze();
        $fuiou->setMchntTxnSsn($this->borrowerFreezeSerialNum);
        $fuiou->request($data);
        $response = $fuiou->response();
        Log::info(__FUNCTION__.__LINE__.',amount freeze with response=',$response);

        if(!($response['msg']['resp_code'] && $response['msg']['resp_code'] ==='0000')) {
            Log::error(__FUNCTION__.__LINE__.',amount freeze failed with');
            return $this->errorMessage = self::BORROWER_FUND_FREEZE_FAIL;
        }

        // 额外的利息划拨到平台户
        if($this->anotherInterest > 0) {
            $amtToMobile = config("system.fy_platform_account");
            if(!$amtToMobile) {
                return $this->errorMessage = self::WABAO_ACCOUNT_ABNORMAL;
            }
            $data = [
                'out_cust_no' => $amtFromMobile,
                'in_cust_no'  => $amtToMobile,
                'amt' => $this->anotherInterest,
            ];
            $fuiou = new Fuiou();
            $fuiou->transferAccounts();
            $fuiou->request($data);
            $response = $fuiou->response();
            if(!(isset($response['msg']['resp_code']) && $response['msg']['resp_code'] === '0000')) {
                return $this->errorMessage = self::TRANSFER_FUND_FAIL;
            }
        }

        return true;
    }

    /**
     * 设置还款计划数据为已还款
     */
    public function setBorrowerNoRepayData()
    {
        // 设置未还款的数据为已还款
        if(!$this->borrowerRepay->setBorrowerNoRepayData($this->uid, $this->pid)) {
            return $this->errorMessage = self::SAVE_BORROWER_REPAY_FAIL;
        }

        // 设置提前还款时间，设置状态为还款结束
        if(!$this->project->earlyRepayTime($this->pid)) {
            return $this->errorMessage = self::SET_EARLY_REPAY_TIME_FAIL;
        }

        // 获取散标的合并ID
        $projectData = $this->project->getProjectDataById($this->pid);
        if(!empty($projectData['merge_id']) && $this->project->getNoFinishNum($projectData['merge_id']) == 0) {
            if(!$this->project->setRepayFinish($projectData['merge_id'])) {
                return $this->errorMessage = self::SET_REPAY_FINISH_FAIL;
            }
        }

        // 新增富友资金记录
        $amtToUid = config("system.fy_platform_account");
        if(!$this->fyFundRecord->addTransfer($this->uid, $this->anotherInterest, $amtToUid)) {
            return $this->errorMessage = self::ADD_TRANSFER_FAIL;
        }

        // 新增借款人资金记录
        if(!$this->borrowerFundTransfer->addBankWithholdData($this->uid, $this->allCorpus+$this->anotherInterest)) {
            return $this->errorMessage = self::ADD_BORROWER_FUND_RECORD_FAIL;
        }

        // 设置借款申请为已借完
        if(!$this->loanApply->setLoanApplyFinish($this->loanApplyId)) {
            return $this->errorMessage = self::SET_LOAN_APPLY_FINISH_FAIL;
        }

        // 新增借款人冻结记录
        $this->borrowerFreezeSerialNum = date('YmdHis').rand(1000,9999);
        $freezeData = [
            'serial_num'    => $this->borrowerFreezeSerialNum,
            'pid'            => $this->pid,
            'table_name'    => FundFreezeRecord::TAB_BORROWER_REPAY,
            'amt'            => $this->allCorpus,
            'from_uid'      => $this->uid,
            'status'        => FundFreezeRecord::STATUS_OMNER_FREEZE,
        ];
        if(!$this->fundFreezeRecord->borrowerRepayBatchAddFreezeData($freezeData)) {
            return $this->errorMessage = self::ADD_BORROWER_FREEZE_DATA_FAIL;
        }

        // 更新出借记录表中的剩余期数
        $surplusPeriods = $this->borrowerRepay->getSurplusPeriods($this->pid);
        if(!$this->lenderInvest->updateSurplusPeriods($this->pid, $surplusPeriods)) {
            return $this->errorMessage = self::UPDATE_SURPLUS_PERIODS_FAIL;
        }

        // 更新借款人的待还金额
        if(!$this->borrower->updateNoRepayMoney($this->uid, 0)) {
            return $this->errorMessage = self::UPDATE_NO_REPAY_MONEY;
        }

        return true;
    }

    /**
     * 借款人自动还款
     */
    public function autoRepayment()
    {
        $startTime = strtotime(date('Y-m-d'));
        $endTime = $startTime + 86400;
        $noRepayIds = [];
        while (($this->noRepayData = $this->borrowerRepay->getOneNoRepayDataInDay($startTime, $endTime)) && !in_array($this->noRepayData['id'], $noRepayIds)) {
            $noRepayIds[] = $this->noRepayData['id'];
            // 开启数据库事务
            DB::beginTransaction();
            // 设置为正常还款 + 新增富友资金记录 + 新增自动还款成功日志
            if(true !== $this->setAutoRepaymentSuccess()) goto fail;
            // 委托充值 + 资金划拨
            if(true !== $this->rechargeAndTransfer()) goto fail;
            // 提交数据库事务
            DB::commit();
            if(!$this->borrowerRepay->getNoRepayDataInTheProject($this->noRepayData['pid'], $this->noRepayData['id'])) {
                // 全部已还清，发送短信
                $this->RepaymentOverSms($this->noRepayData['uid']);
            }else {
                // 未全部已还清，发送短信
                $mobile = $this->users->getMobile($this->noRepayData['uid']);
                $this->repaymentSuccessSms($mobile,$this->noRepayData['period']);
            }
            continue;

            fail: {
                // 回滚数据库事务
                DB::rollback();
                // 设置为逾期未还 + 新增自动还款失败日志
                $this->setAutoRepaymentFail();
            }
        }

        return;
    }

    /**
     * 设置为正常还款 + 新增富友资金记录 + 新增借款人资金记录 + 新增自动还款成功日志
     */
    public function setAutoRepaymentSuccess()
    {
        // 设置为正常还款
        if(!$this->borrowerRepay->setRepayDataRepaid($this->noRepayData['id'])) {
            return $this->errorMessage = self::SET_REPAY_DATA_REPAID_FAIL;
        }

        // 如果没有未还款的还款记录，则产品状态为还款结束
        if(!$this->borrowerRepay->getNoRepayDataInTheProject($this->noRepayData['pid'], $this->noRepayData['id'])) {
            if(!$this->project->setRepayFinish($this->noRepayData['pid'])) {
                return $this->errorMessage = self::SET_REPAY_FINISH_FAIL;
            }

            if(!$this->loanApply->setLoanApplyFinish($this->noRepayData['lid'])) {
                return $this->errorMessage = self::SET_LOAN_APPLY_FINISH_FAIL;
            }

            $projectData = $this->project->getProjectDataById($this->noRepayData['pid']);
            if(!empty($projectData['merge_id']) && $this->project->getNoFinishNum($projectData['merge_id']) == 0) {
                if(!$this->project->setRepayFinish($projectData['merge_id'])) {
                    return $this->errorMessage = self::SET_REPAY_FINISH_FAIL;
                }
            }
        }

        // 新增借款人还款银行卡代扣记录
        $allAmt = $this->noRepayData['corpus'] + $this->noRepayData['interest'];
        if(!$this->borrowerFundTransfer->addBankWithholdData($this->noRepayData['uid'], $allAmt)) {
            return $this->errorMessage = self::ADD_BORROWER_FUND_RECORD_FAIL;
        }

        // 新增富友资金记录，借款人划拨额外的利息到平台户
        $amtToUid = config("system.fy_platform_account");
        $anotherInterest = $this->noRepayData['interest'] - $this->noRepayData['invest_interest'];
        if(!$this->fyFundRecord->addTransfer($this->noRepayData['uid'], $anotherInterest, $amtToUid)) {
            return $this->errorMessage = self::ADD_FY_FUND_RECORD_FAIL;
        }

        // 新增借款人资金冻结记录
        $this->borrowerFreezeSerialNum = date('YmdHis').rand(1000,9999);
        $borrowerFreezeData = [
            'serial_num'    => $this->borrowerFreezeSerialNum,
            'pid'            => $this->noRepayData['pid'],
            'table_name'    => FundFreezeRecord::TAB_BORROWER_REPAY,
            'amt'            => $this->noRepayData['corpus'] + $this->noRepayData['invest_interest'],
            'from_uid'      => $this->noRepayData['uid'],
            'status'        => FundFreezeRecord::STATUS_OMNER_FREEZE,
        ];
        if(!$this->fundFreezeRecord->borrowerRepayBatchAddFreezeData($borrowerFreezeData)) {
            return $this->errorMessage = self::ADD_BORROWER_FREEZE_DATA_FAIL;
        }

        // 更新出借记录表中的剩余期数
        $surplusPeriods = $this->borrowerRepay->getSurplusPeriods($this->noRepayData['pid']);
        if(!$this->lenderInvest->updateSurplusPeriods($this->noRepayData['pid'], $surplusPeriods)) {
            return $this->errorMessage = self::UPDATE_SURPLUS_PERIODS_FAIL;
        }

        // 更新借款人的待还金额
        if(!$this->borrower->updateNoRepayMoney($this->noRepayData['uid'], $this->noRepayData['corpus'] + $this->noRepayData['invest_interest'])) {
            return $this->errorMessage = self::UPDATE_NO_REPAY_MONEY;
        }

        return true;
    }

    /**
     * 委托充值 + 资金划拨
     */
    public function rechargeAndTransfer()
    {
        // 划拨到平台户的金额 = 借款利息 - 投资利息
        $anotherInterest = $this->noRepayData['interest'] - $this->noRepayData['invest_interest'];
        // 充值金额 = 本金 + 借款利息
        $rechargeAmt = $this->noRepayData['corpus'] + $this->noRepayData['interest'];
        // 冻结金额 = 本金 + 出借利息
        $freezeAmt = $this->noRepayData['corpus'] + $this->noRepayData['invest_interest'];
        // 还款用户
        $amtFromMobile = $this->fyAccount->getMobileById($this->noRepayData['uid']);
        $data = [
            'login_id' => $amtFromMobile,
            'amt' => $rechargeAmt,
        ];
        $fuiou = new Fuiou();
        $fuiou->entrustRecharge();
        $fuiou->request($data);
        $response = $fuiou->response();
        if(!(isset($response['msg']['resp_code']) && $response['msg']['resp_code'] === '0000')) {
            $this->autoRepayLogRemark = !empty($response['msg']['resp_desc']) ? $response['msg']['resp_desc'] : self::BANK_WITHHOLD_FAIL;
            return $this->errorMessage = self::BANK_WITHHOLD_FAIL;
        }

        // 冻结借款人的资金
        $data = [
            'cust_no'   => $amtFromMobile,
            'amt'        => $rechargeAmt > $freezeAmt ? $freezeAmt : $rechargeAmt
        ];
        $fuiou = new Fuiou();
        $fuiou->freeze();
        $fuiou->request($data);
        $response = $fuiou->response();
        if(!(isset($response['msg']['resp_code']) && $response['msg']['resp_code'] === '0000')) {
            return $this->errorMessage = self::BORROWER_FUND_FREEZE_FAIL;
        }

        // 利息的差额转账到平台户
        if($anotherInterest > 0) {
            $amtToMobile = config("system.fy_platform_account");
            $data = [
                'out_cust_no' => $amtFromMobile,
                'in_cust_no'  => $amtToMobile,
                'amt' => $anotherInterest,
            ];
            $fuiou = new Fuiou();
            $fuiou->transferAccounts();
            $fuiou->request($data);
            $response = $fuiou->response();
            if(!(isset($response['msg']['resp_code']) && $response['msg']['resp_code'] === '0000')) {
                $this->autoRepayLogRemark .= !empty($response['msg']['resp_desc']) ? $response['msg']['resp_desc'] : self::AUTO_TRANSFER_FAIL;
                return $this->errorMessage = self::AUTO_TRANSFER_FAIL;
            }
        }

        return true;
    }

    /**
     * 设置为逾期未还 + 新增自动还款失败日志
     */
    public function setAutoRepaymentFail()
    {
        // 设置还款记录状态为逾期未还
        if(!$this->borrowerRepay->setRepayDataOverdue($this->noRepayData['id'])) {
            return $this->errorMessage = self::SET_REPAY_DATA_OVERDUE_FAIL;
        }

        // 新增自动还款失败日志
        if(!$this->autoRepayLog->addFailData($this->noRepayData['id'], $this->autoRepayLogRemark)) {
            return $this->errorMessage = self::ADD_AUTO_REPAY_LOG_FAIL;
        }

        return true;
    }

    /**
     * 还款日前第三天发送短信提醒
     */
    public function repaymentNotice()
    {
        $startTime = strtotime(date('Y-m-d', strtotime("-3 days")));
        $endTime = $startTime + 86400;
        $repayIds = [];
        while (($repayData = $this->borrowerRepay->getOneNoRepayDataInDay($startTime, $endTime)) && !in_array($repayData['id'], $repayIds)) {
            // 手机号
            $mobile = $this->users->getMobile($repayData['uid']);
            // 期数
            $period = $repayData['period'];
            // 发送短信提醒
            $smsService = new SmsService();
            $text = str_replace(['#username#','#qishu#'], [$mobile,$period], $smsService->tpl['remindLoad']);   //替换模板内容
            $smsService->noticeSms($mobile, $text);
            return true;
        }

        return;
    }

    /**
     * 还款成功发送短信
     */
    public function repaymentSuccessSms($mobile,$period)
    {
        // 发送短信提醒
        $smsService = new SmsService();

        //短信模板
        $text = str_replace(['#username#','#qishu#'], [$mobile,$period], $smsService->tpl['repaySuccess']);   //替换模板内容
        //发送短信
        $smsService->noticeSms($mobile, $text);
    }

    /**
     * 还款失败发送短信
     */
    public function RepaymentOverSms($uid)
    {
        //手机号
        $mobile = $this->users->getMobile($uid);
        // 发送短信提醒
        $smsService = new SmsService();
        //短信模板
        $text = str_replace(['#username#'], [$mobile], $smsService->tpl['repaySettle']);   //替换模板内容
        //发送短信
        $smsService->noticeSms($mobile, $text);
    }

    /**
     * 设置还款数据为还款异常
     */
    public function setBorrowerRepayAbnormal()
    {
        // 设置还款数据为还款异常
        $this->borrowerRepay->setRepayAbnormal($this->noRepayData['id']);
        // 把划拨预冻结的用户列表写入到异常日志里
        $describe = "划拨预冻结失败的用户列表：".implode(',', $this->abnormalUid);
        $this->workingAbnormal->autoRepayTransferAndFreezeFail($this->noRepayData['id'], $describe);
    }

    /**
     * 设置提前还款的所有期数的还款数据为异常
     */
    public function setEarlyBorrowerRepayAbnormal()
    {
        foreach ($this->abnormalUid as $period=>$uids) {
            // 设置某一期还款数据为还款异常
            $this->borrowerRepay->setRepayAbnormalOfPeriod($this->pid, $period);
            // 把划拨预冻结的用户列表写入到异常日志里
            $describe = "划拨预冻结失败的用户列表：".implode(',', $uids);
            $this->workingAbnormal->autoRepayTransferAndFreezeFail($this->pid, $period, $describe);
        }
    }
}
