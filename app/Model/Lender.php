<?php

namespace App\Model;

use Illuminate\Support\Facades\Log;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use App\Fuiou\Fuiou;



class Lender extends Model
{
    /**
     * 指定对应的表，默认对应的表是模型的小写复数，即lenders
     *
     * @var string
     */
    protected $table      = "lender";
    protected $primaryKey = 'uid';

    //基本资金信息 余额 总资金等
    public function fundData($uid)
    {
        $data = DB::table('lender')
            ->leftJoin('risk_type', 'risk_type.id', 'lender.risk_lvl')
            ->select('lender.all_profit', 'risk_type.name', 'lender.score_risk')
            ->where('uid', $uid)
            ->first();

        return $data;
    }

    //修改投资人的风险等级
    public function updateRiskLvl($risk_id, $uid, $score)
    {

        $res = DB::table('lender')
            ->where('uid', $uid)
            ->update([
                'risk_lvl'   => $risk_id,
                'score_risk' => $score
            ]);

        return $res;
    }

    /**
     * 出借人投资，更新账户资金数据
     */
    public function investUpdateData($uid, $all_assets, $balance, $invest_money)
    {
        $lenderData = self::where(['uid' => $uid])->first();
        if ($lenderData) {
            $lenderData->balance      = $balance;
            $lenderData->invest_money = $invest_money;
            return $lenderData->save();
        } else {
            $this->uid          = $uid;
            $this->all_assets   = $all_assets;
            $this->balance      = $balance;
            $this->invest_money = $invest_money;
            return $this->save();
        }
    }

    //理财端获取余额
    public function yuE($uid)
    {
        $data = DB::table('lender')
            ->where('uid', $uid)
            ->value('balance');

        return $data;
    }

    //投资人表添加资产
    public function updateChongzhiAsset($money, $uid)
    {
        $sql = "update lender set all_assets=all_assets+?, balance=balance+? where uid = ?";
        $res = DB::update($sql, [$money, $money, $uid]);

    }

    public function updateTixianAsset($money, $uid)
    {
        $sql = "update lender set all_assets=all_assets-?, balance=balance-? where uid = ?";
        $res = DB::update($sql, [$money, $money, $uid]);
    }

    //添加一条投资人记录
    public function addLender($id)
    {
        $this->uid = $id;
        $this->save();
    }

    /**
     * 获取出借人数据
     */
    public function getLenderByUid($uid)
    {
        $lenderData = [];
        if ($uid && ($lenderData = self::where(['uid' => $uid])->first())) {
            $lenderData = $lenderData->original;
        }
        return $lenderData;
    }

    /**
     * 获取出借人列表(实时获取投资人资金)
     * $uid 用户id ，不为空则根据uid查找出借用户
     * $cPage 当前页索引
     * $pSize 每页显示数量
     *
     */
    public function getLenderList($mobile,$name,$cPage,$pSize)
    {
        $data=[];
        Log::info(__FILE__ .__FUNCTION__.__LINE__."get lender list start. init params:".$mobile.$name.$cPage.$pSize);

        $mdb = DB::table('lender')
            ->leftJoin('users', 'users.id', 'lender.uid')
            ->leftJoin('fy_account', 'users.id', 'fy_account.uid')
            ->select('lender.uid','lender.all_assets',  'lender.balance','lender.invest_money',
                'lender.all_profit','lender.score_risk','fy_account.full_name',"fy_account.mobile");

        if ($mobile){
            $data['list'] = $mdb ->where(['users.mobile' => $mobile]) ->get();
            $data['total'] =$mdb->count();

        }else if($name) {
            $data['list'] = $mdb->where(['users.name' => $name])->get();
            $data['total'] =$mdb->count();

        }else{
            $data['list']=$mdb->offset(($cPage-1)*$pSize)->limit($pSize)->get();
            $result['total']=$mdb->count();
        }

        //Log::info(__FUNCTION__.__LINE__.'get db --mobile=',$data);

        //循环序列化需要请求的手机号码以|分割
        $mobiles='';
        foreach ($data['list'] as $i =>$item){
            $mobiles.= $item->mobile ? $item->mobile.'|':'';
            $data['list'][$i]->full_name=Authentic::where('uid',$item->uid)->value('full_name');
        }
        //去除最后一个字符|
        $mobiles=substr($mobiles,0,-1);

        Log::info(__FUNCTION__.__LINE__.'get serial mobiles='.$mobiles);

        $dataR = [
            'mchnt_txn_dt' =>date('Ymd'),
            'cust_no'=>$mobiles // '15921040001|15921040002'
        ];
        $fuiou=new Fuiou();

        $fuiou->accountBalance();
        $fuiou->request($dataR);
        $res=$fuiou->response();

        Log::info(__FUNCTION__.__LINE__.'get fuyou response data='. print_r($res,true));

        if($res['msg']['resp_code']==='0000'){
            $result=$res['msg']['results']['result'];
            foreach ($result as $ir=>$item){
                //Log::info(__FUNCTION__.__LINE__.',get fuyou item type='. gettype($item));
                // TODO 这里有一个坑，foreach对数组的处理，只认识当前结构下的数据,这个item有可能是数组，有可能是数组中的成员。
                if(is_string($item)){
                    $data['list'][$i]->all_assets=$result['ct_balance'];
                    $data['list'][$i]->balance=$result['ca_balance'];
                    break;
                }else{
                    $userId=$item['user_id'];
                    foreach ($data['list'] as $i =>$v){

                        if($v->mobile === $userId){
                            $data['list'][$i]->all_assets=$item['ct_balance'];
                            $data['list'][$i]->balance=$item['ca_balance'];
                            break;
                        }
                    }
                }
            }
        }

        //Log::info(__FUNCTION__.__LINE__.',get serial mobiles='. print_r($data['list'],true));

        $data['cPage']=$cPage;

        Log::debug(__FILE__ .__FUNCTION__.__LINE__."get lender list end. res=".print_r($data,true));
        return $data;
    }

}
