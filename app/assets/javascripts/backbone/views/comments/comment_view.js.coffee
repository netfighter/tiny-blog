class Blog.Views.CommentView extends Backbone.View

  template: JST["backbone/templates/comments/comment"]

  events:
    "click .comment-destroy" : "destroy"

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  destroy: (e) ->
    e.preventDefault()
    e.stopPropagation()

    if confirm('Are you sure?')
      @model.destroy()
      this.remove()

    return false
