class Blog.Views.PostView extends Backbone.View
  template: JST["backbone/templates/posts/post"]

  tagName: "div"

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
