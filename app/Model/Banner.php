<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Banner extends Model
{
    /**
     * Banner表
     *
     * @var string
     */
    protected $table;

    public function __construct()
    {
        $this->table = 'banner';
    }

    /**
     * 获取banner
     */
    public function bannerInfo($type)
    {
        $data = DB::table($this->table)->where('type','=',$type)->where('status','=','1')->get();
        return $data;
    }
}
