class Blog.Routers.PostsRouter extends Backbone.Router

  initialize: (options) ->
    @posts = new Blog.Collections.PostsCollection()
    @posts.reset options.posts

  routes:
    "posts/index"       : "index"
    "posts/new"         : "new"
    "posts/:id"         : "show"
    "posts/:id/edit"    : "edit"
    ".*"                : "index"

  name: "Post"

  index: ->
    @view = new Blog.Views.PostsIndexView({collection: @posts})

  new: ->
    post = new Blog.Models.Post()
    @view = new Blog.Views.PostsNewView({model: post, collection: @posts})

  show: (id) ->
    post = @posts.get(id)
    @view = new Blog.Views.PostsShowView({model: post})

  edit: (id) ->
    post = @posts.get(id)
    @view = new Blog.Views.PostsEditView({model: post})
