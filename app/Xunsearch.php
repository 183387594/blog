<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use XS;
use XSDocument;

class Xunsearch extends Model
{
    //

    public static function add($data)
    {
        $xs = new XS('blog');
        $index = $xs->index;
        $doc = new XSDocument;
        $doc->setFields($data);
        $index->add($doc);
    }

    public static function edit($data)
    {
        $xs = new XS('blog');
        $index = $xs->index;
        $doc = new XSDocument;
        $doc->setFields($data);
        $index->update($doc);
    }

    public static function del($id)
    {
        $xs = new XS('blog');
        $index = $xs->index;
        $index->del($id);
    }

    public static function clear()
    {
        $xs = new XS('blog');
        $index = $xs->index;
        $index->clean();
    }
}
