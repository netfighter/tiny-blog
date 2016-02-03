$ ->

  Navigation = ->
    @d = $.Deferred()
    that = this

    @handleRouter = (router) ->
      $(window).unbind('hashchange', that.handleBreadcrumbs)
      $(window).bind 'hashchange', ->
        that.handleBreadcrumbs(router)
        return
      that.handleBreadcrumbs(router);

    @handleBreadcrumbs = (router) ->
      breadcrumbs = []
      breadcrumbs.push('<li><a href="#posts/index">Home</a></li>')
      currentUrl = Backbone.history.fragment

      for routeName of router.routes
        routeMatcher = currentUrl.replace(/\d+/g, ':id')

        if routeName == routeMatcher
          if router.routes[routeName] != 'index'
            crumbName = _.string.capitalize(router.routes[routeName]) + " " + router.name
            breadcrumbs.push('<li>' + crumbName + '</li>')

      if $('.breadcrumb').length == 0
        $('<ol class="breadcrumb"></ol>').insertBefore('#posts')
      $('.breadcrumb').html("");
      for i of breadcrumbs
        $('.breadcrumb').append(breadcrumbs[i])

      return

    return

  Backbone.Navigation = Navigation
  return
