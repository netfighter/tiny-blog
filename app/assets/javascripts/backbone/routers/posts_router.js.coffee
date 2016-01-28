class Blog.Routers.PostsRouter extends Backbone.Router
  initialize: ->
    @posts = new Blog.Collections.PostsCollection()

  routes:
    "posts/index"       : "index"
    "posts/new"         : "new"
    "posts/:id"         : "show"
    "posts/:id/edit"    : "edit"
    ".*"                : "index"

  name: "Post"

  index: ->
    @view = new Blog.Views.PostsIndexView({ collection: @posts })

  new: ->
    post = new Blog.Models.Post()
    @view = new Blog.Views.PostsNewView({ model: post, collection: @posts })

  show: (id) ->
    post = new Blog.Models.Post({ id: id })
    @view = new Blog.Views.PostsShowView({ model: post })

  edit: (id) ->
    post = new Blog.Models.Post({ id: id })
    @view = new Blog.Views.PostsEditView({ model: post })
