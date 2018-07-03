<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use DB;

/**
 * 测试模型
 * @author mashouchao
 * @SWG\Definition(type="object", @SWG\Xml(name="Test"))
 */
class Test extends Model
{

    protected $table;

    /**
     * @SWG\Property(format="int64")
     * @var int
     */
    public $id;
    
    /**
     * @SWG\Property(format="int32")
     * @var int
     */
    public $type;
    
    /**
     * @var string
     * @SWG\Property()
     */
    public $url;
    
    /**
     * @var string
     * @SWG\Property()
     */
    public $href;
    
    public function __construct()
    {
        $this->table = 'test';
    }

    /**
     * @author noner
     * @param unknown
     * 根据parm 查询uid条件 取出地址
     * 
     */
    public function getListBanner($where)
    {
        return DB::table($this->table)->where($where)->get()->toArray();
    }

}
