class Blog.Views.PostsShowView extends Backbone.View

  template: JST["backbone/templates/posts/show"]

  events:
    "click .destroy" : "destroy"

  el: '#posts'

  initialize: ->
    $(@el).off 'click', '.destroy'
    @render()

  render: ->
    @$el.html(@template(@model.toJSON()))
    @model.fetch(success: (model) ->
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

    if confirm('Are you sure?')
      @model.destroy()
      window.location.hash = "/posts/index"

    return false;
