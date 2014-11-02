App.factory 'HomeViewModel', ($q, $location, $timeout, BlogRemoteService
, BlogService, BaseViewModel, Util, Cache) ->

  class HomeViewModel extends BaseViewModel
    ## Override
    bindView: =>
      BlogRemoteService.getBlogs().then (blogs) =>
        @data.blogs = @processBlogs blogs

    processBlogs: (blogs) ->
      _.map blogs, BlogService.decorateBlog

    ## Override
    bindAction: =>
