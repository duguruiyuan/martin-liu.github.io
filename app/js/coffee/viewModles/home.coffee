App.factory 'HomeViewModel', (BlogRemoteService
, BlogService, BaseViewModel, Util) ->

  class HomeViewModel extends BaseViewModel
    ## Override
    bindView: =>
      BlogRemoteService.getBlogs().then (blogs) =>
        @data.blogs = @processBlogs blogs

    processBlogs: (blogs) ->
      _.map blogs, BlogService.decorateBlog

    ## Override
    bindAction: =>
