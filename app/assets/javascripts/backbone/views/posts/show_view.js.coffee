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

      # display new comment form
      new_comment = new Blog.Models.PostComment()
      new_comment.urlRoot = model.url() + '/comments'
      newCommentView = new Blog.Views.CommentsNewView({model: new_comment, collection: model.get('comments')})
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
