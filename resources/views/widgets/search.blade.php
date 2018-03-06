<div class="container list">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            @forelse($articles as $article)
                <div class="media">
                    @if($article->page_image)
                        <a class="media-left" href="{{ url($article->slug) }}">
                            <img alt="{{ $article->slug }}" src="{{ $article->page_image }}" data-holder-rendered="true">
                        </a>
                    @endif
                    <div class="media-body">
                        <h6 class="media-heading">
                            <a href="{{ url($article->slug) }}">
                                {!! $search->highlight($article->title) !!}
                            </a>
                        </h6>
                        <div class="meta">
                            <span class="cinema">{!! $search->highlight($article->subtitle) !!}</span>
                        </div>
                        <div class="description">
                            {!!  $search->highlight($article->content) !!}
                        </div>
                        <div class="extra">

                            <div class="info">
                                <a href="{{ url($article->slug) }}" class="pull-right">
                                    Read More <i class="ion-ios-arrow-forward"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            @empty
                <h3 class="text-center">{{ lang('Nothing') }}</h3>
            @endforelse
        </div>
    </div>
</div>