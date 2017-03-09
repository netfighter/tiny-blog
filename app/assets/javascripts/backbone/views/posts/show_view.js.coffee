class Blog.Views.PostsShowView extends Backbone.View

  template: JST["backbone/templates/posts/show"]

  events:
    "click .destroy" : "destroy"

  el: '#posts'

  initialize: ->
    $(@el).off 'click', '.destroy'
    @render()

  render: ->
    @model.fetch(success: (model) =>
      mdConverter = new showdown.Converter()
      @$el.html(@template(Object.assign({}, model.toJSON(), { mdConverter: mdConverter })))

      # display comments
      commentsView = new Blog.Views.CommentsIndexView({collection: model.get('comments')})
      commentsView.render()
      commentsView.delegateEvents()

      # display the new comment form
      newCommentView = new Blog.Views.CommentsNewView({parentModel: model})
      newCommentView.render()
      newCommentView.delegateEvents()
    )
    @

  destroy: (e) ->
    e.preventDefault()
    e.stopPropagation()

    if confirm('Are you sure you want to delete this record?')
      @model.destroy()
      window.location.hash = "/posts/index"

    return false;
