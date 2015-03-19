class Blog.Views.CommentsNewView extends Backbone.View
  el: '#new-comment-container'

  template: JST["backbone/templates/comments/new"]

  events:
    "submit #new-comment": "save"

  initialize: (options) ->
    @list = $('#comments-list')
    @options = options
    @reset()
    Backbone.Validation.unbind this
    Backbone.Validation.bind this
    @render()

  reset: ->
    newComment = new Blog.Models.PostComment()
    newComment.urlRoot = @options['parentModel'].url() + '/comments'
    @model = newComment
    @collection = @options['parentModel'].get('comments')

  render: ->
    @$el.html @template()

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    content = $('#content').val()
    @model.set {content: content}

    if @model.isValid(true)
      @model.save {},
        success: () =>
          @model.set('user', window.user)
          @collection.add(@model)
          @reset()
          @render()

    return false
