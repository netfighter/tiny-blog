class Blog.Views.CommentsIndexView extends Backbone.View

  el: '#comments'

  template: JST["backbone/templates/comments/index"]

  initialize: ->
    @collection.on 'add', @render, @
    @render()

  addAll: ->
    @collection.forEach(@addOne, @)

  addOne: (model) ->
    @view = new Blog.Views.CommentView({model: model})
    @$el.find('#comments-list').append @view.render().el

  render: ->
    @$el.html @template()
    @addAll()
    @
