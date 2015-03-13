class Blog.Views.CommentsNewView extends Backbone.View
  el: '#new-comment-container'

  template: JST["backbone/templates/comments/new"]

  events:
    "submit #new-comment": "save"

  initialize: ->
    @list = $('#comments-list')
    Backbone.Validation.unbind this
    Backbone.Validation.bind this
    @render()

  render: ->
    @$el.html @template()

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    content = $('#content').val()
    @model.set {content: content}

    if @model.isValid(true)
      return true
#      @collection.create @model,
#        success: (comment) =>
#          @model = comment
#          $('#new-comment')[0].reset()
#          window.location.hash = "/posts/#{comment.get('post_id')}"

    return false
