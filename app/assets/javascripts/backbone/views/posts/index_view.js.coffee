class Blog.Views.PostsIndexView extends Backbone.View

  el: '#posts'

  template: JST["backbone/templates/posts/index"]

  initialize: ->
    @listenTo @collection, 'reset', @render
    @collection.fetch({ reset: true })

  render: ->
    @$el.html @template()
    @addAll()
    @

  addAll: ->
    @collection.forEach(@addOne, @)

  addOne: (model) ->
    @view = new Blog.Views.PostView({model: model})
    @$el.find('#posts-list').append @view.render().el
