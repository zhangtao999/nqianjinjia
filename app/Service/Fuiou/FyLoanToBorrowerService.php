<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Service\Fuiou;

use App\Fuiou\Fuiou;
use App\Model\FundFreezeRecord;
use App\Model\FyAccount;
use App\Model\FyFundRecord;
use App\Model\LoanApply;
use App\Model\LoanApplyProject;
use App\Model\Project;
use Illuminate\Support\Facades\Log;

class FyLoanToBorrowerService
{

    const PROJECT_DATA_NULL = '产品数据为空';
    const LOAN_APPLY_DATA_NULL = '借款申请数据为空';
    const BORROWER_FY_ACCOUNT_NULL = '借款人富友账户数据为空';
    const WB_FY_ACCOUNT_NULL = '挖宝富有账号数据为空';
    const TRANSFER_FUND_FAIL = '资金划拨失败';
    const UN_FREEZE_FAIL = '资金解冻失败';
    const ENTRUST_WITHDRAW_FAIL = '委托提现失败';
    const FUND_FREEZE_RECORD_NULL = '资金冻结数据为空';

    private $pid;
    private $borrowerFyAccount;
    private $errorMessage;
    private $project;
    private $projectData;
    private $fyAccount;
    private $loanApplyProject;
    private $loanApply;
    private $loanApplyData;
    private $serialNum;
    private $fyFundRecord;
    private $fundFreezeRecord;
    private $fundFreezeRecordData;
    private $loanAllAmt;
    private $pids;

    public function __construct()
    {
        $this->project = new Project();
        $this->fyAccount = new FyAccount();
        $this->loanApplyProject = new LoanApplyProject();
        $this->loanApply = new LoanApply();
        $this->fyFundRecord = new FyFundRecord();
        $this->fundFreezeRecord = new FundFreezeRecord();
    }

    public function __set($name, $value)
    {
        $this->$name = $value;
    }

    /**
     * 放款到借款人
     */
    public function loanToBorrower()
    {
        // 获取放款的相关数据
        if(true !== $this->getLoanData()) goto fail;
        // 资金解冻
        if(true !== $this->fundTransfer()) goto fail;
        // 委托提现
        if(true !== $this->withdrawToBank()) goto fail;
        // 更新数据表记录
        if(true !== $this->addFundRecordData()) goto fail;

        return true;
        fail:
            return $this->errorMessage;
    }

    /**
     * 合并标一次性放宽到借款人
     */
    public function mergeProjectLoanToBorrower()
    {
        // 获取合并标下面的所有散标ID
        if(true !== $this->getPidsFromMergeProject()) goto fail;
        foreach ($this->pids as $this->pid) {
            // 获取放款的相关数据
            if(true !== $this->getLoanData()) goto inside_fail;
            // 资金解冻
            if(true !== $this->fundTransfer()) goto inside_fail;
            // 委托提现
            if(true !== $this->withdrawToBank()) goto inside_fail;
            // 更新数据表记录
            if(true !== $this->addFundRecordData()) goto inside_fail;
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
     * 获取放款的相关数据
     */
    public function getLoanData()
    {
        // 获取产品数据
        if(!($this->projectData = $this->project->getProjectDataById($this->pid))) {
            return $this->errorMessage = self::PROJECT_DATA_NULL;
        }

        // 获取借款申请数据
        $aid = $this->loanApplyProject->getAidByPid($this->projectData['id']);
        if(!($this->loanApplyData = $this->loanApply->getDataById($aid))) {
            return $this->errorMessage = self::LOAN_APPLY_DATA_NULL;
        }

        // 获取借款人富友账户数据
        if(!($this->borrowerFyAccount = $this->fyAccount->getFyDataById($this->loanApplyData['uid']))) {
            return $this->errorMessage = self::BORROWER_FY_ACCOUNT_NULL;
        }

        // 获取资金冻结数据
        list($this->fundFreezeRecordData,$this->loanAllAmt) = $this->fundFreezeRecord->getLenderInvestFreezeData($this->pid,$this->loanApplyData['uid']);
        if(!$this->fundFreezeRecordData) {
            return $this->errorMessage = self::FUND_FREEZE_RECORD_NULL;
        }

        return true;
    }

    /**
     * 资金划拨
     */
    public function fundTransfer()
    {
        $data = [
            'cust_no'  => $this->borrowerFyAccount['mobile'],
            'amt'       => $this->loanAllAmt
        ];
        Log::info(__FILE__ .__FUNCTION__.__LINE__.'Amount transfer with params=',$data);

        $fuiou = new Fuiou();
        $fuiou->unFreeze();
        $fuiou->request($data);
        $response = $fuiou->response();
        Log::info(__FILE__ .__FUNCTION__.__LINE__.',Amount Transfer result=',$response);

        if(!(isset($response['msg']['resp_code']) && $response['msg']['resp_code'] === '0000')) {
            return $this->errorMessage = self::UN_FREEZE_FAIL;
        }

        return true;
    }

    /**
     * 委托提现
     */
    public function withdrawToBank()
    {
        $data = [
            'login_id' => $this->borrowerFyAccount['mobile'],
            'amt'       => $this->projectData['loan_amount'],
            'rem'       => "loan_apply_id:{$this->loanApplyData['id']}"
        ];
        Log::info(__FILE__ .__FUNCTION__.__LINE__.'，withdrawToBank with params=',$data);
        $fuiou = new Fuiou();
        $fuiou->entrustWithdraw();
        $fuiou->request($data);
        $response = $fuiou->response();

        Log::info(__FILE__ .__FUNCTION__.__LINE__.'，withdrawToBank result=',$response);

        if(!(isset($response['msg']['resp_code']) && $response['msg']['resp_code'] === '0000')) {
            return $this->errorMessage = self::ENTRUST_WITHDRAW_FAIL;
        }else {
            $this->serialNum = $response['msg']['mchnt_txn_ssn'];
        }

        return true;
    }

    /**
     * 更新数据表记录,审核通过后，直接划拨资金给借款人，并免去他们主动提现手续，自动提现到他们卡中。
     */
    public function addFundRecordData()
    {
        // 更新资金冻结数据
        $this->fundFreezeRecord->unFreezeLenderInvestFreezeData($this->pid,$this->loanApplyData['uid']);

        // 新增提现记录
        $this->fyFundRecord->addLoanWithdrawRecord($this->projectData['loan_amount'], $this->borrowerFyAccount['uid'], $this->serialNum);

        // 更新loan_apply表中的流水号字段
        $this->loanApply->setSerialNum($this->loanApplyData['id'], $this->serialNum);

        return true;
    }
}
