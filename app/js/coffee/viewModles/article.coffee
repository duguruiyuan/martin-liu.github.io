App.factory 'ArticleViewModel', ($rootScope, $routeParams, BlogRemoteService
, BlogService, BaseViewModel, Util, Cache) ->

  class ArticleViewModel extends BaseViewModel
    ## Override
    bindView : =>
      id = $routeParams.id
      BlogRemoteService.getBlog(id).then (blog) =>
        if blog.body
          @data.blog = BlogService.decorateBlog blog
          # render markdown
          BlogRemoteService.renderMarkdown(blog.body).then (ret)=>
            @data.content = ret
          # bind root scope
          $rootScope.blog = @data.blog

    ## Override
    bindAction: =>
