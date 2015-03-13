class Blog.Models.Post extends Backbone.NestedAttributesModel
  paramRoot: 'post'
  urlRoot: '/posts',
  defaults:
    title: ''
    content: ''

  validation: {
    title: [
      {
        required: true
        msg: 'Please fill the title field.'
      }
      {
        minLength: 3
        msg: 'The title field must be at least 3 characters long.'
      }
    ]
    content: [
      {
        required: true
        msg: 'Please fill the content field.'
      }
      {
        minLength: 10
        msg: 'The content field must be at least 10 characters long.'
      }
    ]
  }

  relations: [
    {
      type: 'one'
      key: 'user'
      relatedModel: ->
        Blog.Models.User
    }
    {
      key: 'comments'
      relatedModel: ->
        Blog.Models.PostComment
    }
  ]

class Blog.Collections.PostsCollection extends Backbone.Collection
  model: Blog.Models.Post
  url: '/posts'
