class Blog.Views.PostView extends Backbone.View
  template: JST["backbone/templates/posts/post"]

  tagName: "div"

  render: ->
    mdConverter = new showdown.Converter()
    @$el.html(@template(Object.assign({}, @model.toJSON(), { mdConverter: mdConverter })))
    @
