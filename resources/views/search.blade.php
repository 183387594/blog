@extends('layouts.app')

@section('content')
<div class="col-md-10 col-md-offset-1">
    <jumbotron v-cloak>
        <h4><em>{{ request()->get('q') }}</em></h4>

        <h6>在{{$info["total"]}}条数据中，大约有 {{$info["count"]}} 条包含 <em>{{request()->get('q')}}</em> ，查询用时：{{$info['cost']}} 秒。</h6>
        @if(count($info["correct"]))
            <h6>你可能想要找：
            @foreach($info["correct"] as $item)
                <a href="/search?q={{$item}}">{{$item}}</a>
            @endforeach
            </h6>
        @endif
        @if(count($info["related"]))
            <h6>相关搜索：
            @foreach($info["related"] as $item)
                    <a href="/search?q={{$item}}">{{$item}}</a>
            @endforeach
            </h6>
        @endif
    </jumbotron>
</div>
    @include('widgets.search')

@endsection