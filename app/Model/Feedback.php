<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Feedback extends Model
{
    /**
     * 意见反馈
     *
     * @var string
     */
    protected $table;

    public function __construct()
    {
        $this->table = 'feedback';
    }

    public function feedbackAdd($data)
    {
        return DB::table($this->table)->insert($data);
    }
}
