#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Blog =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

# Tell jQuery to watch for any 401 or 403 errors and handle them appropriately
$.ajaxSetup statusCode:
  401: ->
    # Redirect the to the login page.
    window.location =  '/users/sign_in'
    return
  403: ->
    # 403 -- Access denied
    window.location.replace '/403'
    return
  404: ->
    # 404 -- Not Found
    window.location.replace '/404'
    return
  500: ->
    # 500 -- Internal Server Error
    window.location.replace '/500'
    return
