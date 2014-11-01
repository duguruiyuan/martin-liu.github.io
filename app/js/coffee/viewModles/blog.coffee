App.factory 'ArticleViewModel', ($q, $routeParams, BlogRemoteService
, BaseViewModel, Util, Cache) ->

  class ArticleViewModel extends BaseViewModel
    ## Override
    bindView : =>
      id = $routeParams.id
      BlogRemoteService.getBlog(id).then (blog) =>
        if blog.body
          @data.blog = blog
          BlogRemoteService.renderBlog(blog.body).then (ret)=>
            @data.content = ret

    ## Override
    bindAction: =>
