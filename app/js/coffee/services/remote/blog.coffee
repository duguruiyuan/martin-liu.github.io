'use strict'
App.factory 'BlogRemoteService', (Config, Restangular, Util) ->
  repo = Config.githubRepo
  rest = Restangular.all "repos/#{repo.owner}/#{repo.name}"

  getCacheKey = (method, param)->
    "#{Config.name}_BlogRemoteservice_#{method}_#{JSON.stringify param}"
  # Session cache
  getWithCache = (method, param, func, timeout)->
    Util.getWithCache getCacheKey(method, param), true, func, 300

  defaultParam =
    state: "open"
    labels: if !Config.debug then "blog" else ''
    page: 1
    per_page: 10

  @getBlogs = (param) ->
    param = _.extend defaultParam, param
    getWithCache 'issues', param, ->
      rest.one('issues').get param

  @getBlog = (id, param) ->
    param = _.extend defaultParam, param
    getWithCache 'issues' + id, param, ->
      rest.one('issues/' + id).get param

  @renderMarkdown = (text) ->
    getWithCache 'markdown', text, ->
      Restangular.all('markdown').post {
        text: text
        mode: 'gfm'
      }

  return @
