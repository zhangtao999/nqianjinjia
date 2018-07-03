<?php

namespace App\Model;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Region extends Model
{

    /**
     * 全国地区表
     */
    protected $table = 'region';

    /**
     * 获取所有全国地区数据
     */
    public function getAllData()
    {
        $regionObj = self::where(['type'=>1])->get();
        $regionArr = [];
        foreach ($regionObj as $val) {
            $provinceArr = $val->original;
            $cityObj = self::where(['pid'=>$provinceArr['id'],'type'=>2])->get();
            unset($provinceArr['type']);
            unset($provinceArr['pid']);
            unset($provinceArr['id']);
            foreach ($cityObj as $val1) {
                $cityArr = $val1->original;
                $countyObj = self::where(['pid'=>$cityArr['id'],'type'=>3])->get();
                unset($cityArr['type']);
                unset($cityArr['pid']);
                unset($cityArr['id']);
                foreach ($countyObj as $val2) {
                    $countyArr = $val2->original;
                    unset($countyArr['type']);
                    unset($countyArr['pid']);
                    unset($countyArr['id']);
                    $cityArr['county'][] = $countyArr;
                }
                $provinceArr['city'][] = $cityArr;
            }
            $regionArr[] = $provinceArr;
        }

        return $regionArr;
    }
}
