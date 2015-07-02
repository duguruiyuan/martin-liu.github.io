'use strict'
App.factory 'BlogRemoteService', (Config, Restangular, Util
, BaseRemoteService) ->

  defaultParam =
    state: "open"
    labels: if !Config.debug then "blog" else ''
    page: 1
    per_page: 10
    creator: Config.

  new class BlogRemoteService extends BaseRemoteService
    constructor: ->
      repo = Config.githubRepo
      @rest = Restangular.all "repos/#{repo.owner}/#{repo.name}"

    getBlogs: (param) ->
      param = _.extend defaultParam, param
      @doQueryWithCache 'issues', param

    getBlog: (id, param) ->
      param = _.extend defaultParam, param
      @doQueryWithCache 'issues/' + id, param

    renderMarkdown: (text) ->
      @getWithCache 'markdown', text, ->
        Restangular.all('markdown').post {
          text: text
          mode: 'gfm'
        }
