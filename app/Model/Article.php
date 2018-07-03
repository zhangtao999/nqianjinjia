<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Article extends Model
{
    //获取文章
    public function getArticle($id)
    {
        return DB::table('article')
            ->select('title', 'content')
            ->where('id', $id)
            ->first();
    }

    //获取文章的分类(标题)
    public function getArticleCate($type, $p, $c)
    {
        return DB::table('article')
            ->select('id', 'title as name', 'small_title', 'created_at')
            ->where('type', $type)
            ->offset(($p-1)*$c)
            ->limit($c)
            ->get()
            ->toArray();
    }
}
