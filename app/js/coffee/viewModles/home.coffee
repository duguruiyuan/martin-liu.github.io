App.factory 'HomeViewModel', ($q, $location, $timeout, BlogRemoteService
, BaseViewModel, Util, Cache) ->

  class HomeViewModel extends BaseViewModel
    ## Override
    bindView : =>
      BlogRemoteService.getBlogs().then (blogs) =>
        @data.blogs = blogs

    ## Override
    bindAction: =>
