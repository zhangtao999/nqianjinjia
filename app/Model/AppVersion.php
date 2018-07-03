<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

/**
 * APP版本更新表
 *
 * @author mashouchao
 */
class AppVersion extends Model
{
    /**
     * 版本更新表
     *
     * @var string
     */
    protected $table = 'app_version';
}
