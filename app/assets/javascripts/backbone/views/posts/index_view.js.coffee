class Blog.Views.PostsIndexView extends Backbone.View

  el: '#posts'

  template: JST["backbone/templates/posts/index"]

  initialize: ->
    @render()
    @collection.bind 'reset', @addAll, @

  addAll: ->
    @collection.forEach(@addOne, @)

  addOne: (model) ->
    @view = new Blog.Views.PostView({model: model})
    @$el.find('#posts-list').append @view.render().el

  render: ->
    @$el.html @template()
    @addAll()
    @
