<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Model;

use DB;
use Illuminate\Database\Eloquent\Model;

/**
 * Description of UserPlatform
 *
 * @author jackal
 */
class UserPlatform extends Model
{

    /**
     * 用户记录表
     *
     * @var string
     */
    protected $table = 'user_platform';

    /**
     * 根据uid查询register_id 多个
     */
    public function getRegisterIds($parm)
    {
        $ids = DB::table('user_platform')->select('register_id')->where('user_id', $parm)->get()->toArray();
        return $ids;
    }
}
