class Blog.Models.PostComment extends Backbone.NestedAttributesModel
  initialize: ->
    @urlRoot = '/posts/' + @.get('post_id') + '/comments'

  defaults:
    content: ''

  backboneClass: "Comment"

  validation: {
    content: [
      {
        required: true
        msg: 'Please fill the comment field.'
      }
      {
        minLength: 3
        msg: 'The comment field must be at least 3 characters long.'
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
  ]
