App.comments = App.cable.subscriptions.create "CommentsChannel",
  collection: -> $("#comments")

  connected: ->
    setTimeout =>
      @followCurrentPost()
    , 1000

  disconnected: ->

  followCurrentPost: ->
    postId = @collection().data('post-id')
    if postId
      @perform 'follow', post_id: postId
    else
      @perform 'unfollow'

  received: (data) ->
    switch data['action']
      when "create"
        @collection().prepend(data['comment'])
      when "delete"
        @collection().find("#comment-#{data['comment_id']}").remove()
      else null
