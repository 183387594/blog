<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Requests\ArticleRequest;
use App\Repositories\ArticleRepository;
use App\Transformers\ArticleTransformer;
use App\Xunsearch;

class ArticleController extends ApiController
{
    protected $article;

    public function __construct(ArticleRepository $article)
    {
        parent::__construct();

        $this->article = $article;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return $this->respondWithPaginator($this->article->page(), new ArticleTransformer);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\ArticleRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ArticleRequest $request)
    {
        $data = array_merge($request->all(), [
            'user_id'      => \Auth::id(),
            'last_user_id' => \Auth::id()
        ]);

        $data['is_draft']    = isset($data['is_draft']);
        $data['is_original'] = isset($data['is_original']);



        $art = $this->article->store($data);

        $sou_data = [
            "pid"=> $art->id,
            "category_id"=>$data["category_id"],
            "user_id"=>$data['user_id'],
            "slug"=>$art->slug,
            "title"=>$data['title'],
            "page_image"=>$data['page_image'],
            "subtitle"=>$data['subtitle'],
            "meta_description"=>$data['meta_description'],
            "content"=>$data["content"],
            "updated_at"=>strtotime($data["published_at"]),
        ];
        Xunsearch::add($sou_data);

        $this->article->syncTag(json_decode($request->get('tags')));

        return $this->noContent();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        return $this->respondWithItem($this->article->getById($id), new ArticleTransformer);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\ArticleRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ArticleRequest $request, $id)
    {
        $data = array_merge($request->all(), [
            'last_user_id' => \Auth::id()
        ]);

        $art = $this->article->update($id, $data);
        $sou_data = [
            "pid"=> $art->id,
            "category_id"=>$data["category_id"],
            "user_id"=>$data['last_user_id'],
            "slug"=>$art->slug,
            "title"=>$data['title'],
            "page_image"=>$data['page_image'],
            "subtitle"=>$data['subtitle'],
            "meta_description"=>$data['meta_description'],
            "content"=>$data["content"],
            "updated_at"=>strtotime($data["published_at"]),
        ];
        Xunsearch::edit($sou_data);

        $this->article->syncTag(json_decode($request->get('tags')));

        return $this->noContent();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->article->destroy($id);
        Xunsearch::del($id);
        return $this->noContent();
    }
}
