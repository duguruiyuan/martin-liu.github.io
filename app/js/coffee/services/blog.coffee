'use strict'
App.factory 'BlogService', ($rootScope, $q, $timeout, Util)->
  decorateBlog : (blog) ->
    match = /<summary.*"(.*)".*<\/summary>/.exec blog.body
    if match
      blog.summary = match[1]
    blog
