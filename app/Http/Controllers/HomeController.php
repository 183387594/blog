<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use App\Repositories\ArticleRepository;
use XS;

class HomeController extends Controller
{
    protected $article;

    public function __construct(ArticleRepository $article)
    {
        $this->article = $article;
    }

    /**
     * Display the dashboard page.
     * 
     * @return mixed
     */
    public function dashboard()
    {
        return view('dashboard.index');
    }

    /**
     * Search the article by keyword.
     * 
     * @param  Request $request
     * @return mixed
     */
    public function search(Request $request)
    {
        $key = trim($request->get('q'));

        $xs = new XS('blog');
        $search = $xs->search;
        $begin = microtime(true);
        $docs = $search->setQuery($key)->addWeight('title', $key)->search();
        $info['cost'] = microtime(true) - $begin;

//        foreach ($docs as $doc)
//        {
//            $ids[] = $doc->pid;
//            $sou[$doc->pid] = $doc;
//        }
        $info['correct'] = $search->getCorrectedQuery();
        $info['related'] = $search->getRelatedQuery();

        $info['total'] = $search->getDbTotal();
        $info['count'] = $search->getLastCount();
//        $articles = $this->article->search($ids);
//        foreach($articles as $article){
//            $article->title = $search->highlight($sou[$article->id]->title);
//            $article->subtitle = $search->highlight($sou[$article->id]->subtitle);
//            $article->meta_description = $search->highlight($sou[$article->id]->content);
//        }
        return view('search', ["articles"=>$docs,"info"=>$info,"search"=>$search]);
    }
}
