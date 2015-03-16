class Blog.Models.User extends Backbone.NestedAttributesModel
  defaults:
    name: ''
    email: ''

  initialize: ->
    @name()
    @

  name: ->
    @.set('name', [@.get('first_name'),  @.get('last_name')].join(' ').trim())
