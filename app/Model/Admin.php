<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Admin extends Model
{
    /**
     * 后台管理用户表
     *
     * @var string
     */
    protected $table;
    
    public function __construct()
    {
        $this->table = 'admin';
    }
}
