<?php

namespace App\Model;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Loan extends Model
{

    const STATUS_NORMAL = 1;

    /**
     * 借款产品表
     */
    protected $table = 'loan';

    /**
     * 获取借款产品标题
     */
    public function getTitle($id)
    {
        //DB::connection()->enableQueryLog();
        if($id) {
            $data = self::where(['id'=>$id, 'status'=>SELF::STATUS_NORMAL])->select('title')->first();
        }else {
            $data = self::where(['status'=>SELF::STATUS_NORMAL])->select('title')->first();
        }
        //print_r(DB::getQueryLog());exit;
        $loanTitle = [];
        if($data) {
            $loanTitle['title'] = $data->title;
        }
        return $loanTitle;
    }

    /**
     * 获取借款产品详情
     */
    public function getDetail($id)
    {
        //DB::connection()->enableQueryLog();
        if($id) {
            $data = self::where(['id'=>$id, 'status'=>SELF::STATUS_NORMAL])->first();
        }else {
            $data = self::where(['status'=>SELF::STATUS_NORMAL])->first();
        }
        //print_r(DB::getQueryLog());
        $loanDetail = [];
        if($data) {
            $loanDetail = $data->original;
            $loanDetail['material'][] = $loanDetail['material1'];
            $loanDetail['material'][] = $loanDetail['material2'];
            unset($loanDetail['material1']);
            unset($loanDetail['material2']);
        }
        return $loanDetail;
    }

    /**
     * 获取首页显示借款产品信息
     */
    public function indexDetail()
    {
        $data = self::select('id','title','quota_end')->where('status',SELF::STATUS_NORMAL)->first();
        $info = [];
        if($data){
           $info =  $data->original;
        }
        return $info;
    }
}
