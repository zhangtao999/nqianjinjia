<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class BorrowerContactInfo extends Model
{
    //是否又此条数据
    public function hasData($uid)
    {
        return DB::table('borrower_contact_info')
            ->where('uid', $uid)
            ->first();
    }

    //更新信息
    public function updateInfo($uid, $res)
    {
        return DB::table('borrower_contact_info')
            ->where('uid', $uid)
            ->update(['borrower_info_json' => $res]);
    }

    //添加信息
    public function addInfo($uid, $res)
    {
        return DB::table('borrower_contact_info')
            ->insert(['uid' => $uid, 'borrower_info_json' => $res]);
    }
}
