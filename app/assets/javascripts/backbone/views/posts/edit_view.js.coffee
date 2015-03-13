class Blog.Views.PostsEditView extends Backbone.View
  el: '#posts'

  template: JST["backbone/templates/posts/edit"]

  events:
    "submit #edit-post" : "update"

  initialize: ->
    Backbone.Validation.unbind this
    Backbone.Validation.bind this
    @render()

  render: ->
    @$el.html @template(@model.toJSON())
    @

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    title = $('#title').val()
    content = $('#content').val()
    @model.set {title: title, content: content}

    if @model.isValid(true)
      @model.save {title: title, content: content},
        success: (post) =>
          @model = post
          $(@el).off 'submit', '#edit-post'
          window.location.hash = "/posts/#{@model.id}"
    return false
