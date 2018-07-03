<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class FyBankArea extends Model
{
    /**
     * 后台管理用户表
     *
     * @var string
     */
    protected $table;

    public function __construct()
    {
        $this->table = 'fy_bank_area';
    }

    /**
     * 获取银行信息
     */
    public function getBankArea()
    {
        $where['level'] = '1';
        $data = DB::table($this->table)->where($where)->get()->toArray();
        $data = array_map('get_object_vars', $data);
        foreach ($data as &$val) {
            unset($val['code_id']);
            unset($val['id']);
            unset($val['level']);
            $sql = "select name,code from fy_bank_area WHERE level = 2 AND code_id = '{$val['code']}' ";
            $list = DB::select($sql);
            $val['city'] = $list;
        }
        return $data;
    }

    //根据code_id获取省的name
    public function areaSheng($code_id)
    {
        return DB::table('fy_bank_area')
            ->where('code', $code_id)
            ->value('name');
    }
}