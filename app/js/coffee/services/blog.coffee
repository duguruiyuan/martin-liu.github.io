'use strict'
App.factory 'BlogService', (BlogRemoteService)->
  decorateBlog : (blog) ->
    if not blog.body
      return blog

    metaStr = blog.body.substring 0, blog.body.indexOf '-->'

    metaStr = metaStr.replace /\n|\r|<!-{2,}/gm, ' '

    try
      meta = JSON.parse metaStr
    catch e
      console.log e

    blog.meta = meta

    if blog.meta && blog.meta.summary
      BlogRemoteService.renderMarkdown(blog.meta.summary).then (data)->
       blog.meta.summary = data
    blog
