class Blog.Views.PostsNewView extends Backbone.View
  el: '#posts'

  template: JST["backbone/templates/posts/new"]

  events:
    "submit #new-post": "save"

  initialize: ->
    Backbone.Validation.unbind this
    Backbone.Validation.bind this
    @render()

  render: ->
    @$el.html @template()
    new SimpleMDE({ element: @$el.find("#post_content")[0] });

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    title = $(@el).find('#title').val()
    content = $(@el).find('#content').val()
    @model.set { title: title, content: content }

    if @model.isValid(true)
      @model.unset('comments', 'silent')
      @collection.create @model,
        success: (post) =>
          @model = post
          $(@el).off 'submit', '#new-post'
          window.location.hash = "/posts/index"
    return false
