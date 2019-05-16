(function() {
  App.comments = App.cable.subscriptions.create('CommentsChannel', {
    collection: function() {
      return $('#comments');
    },

    connected: function() {
      return setTimeout((function(_this) {
        return function() {
          return _this.followCurrentPost();
        };
      })(this), 1000);
    },

    disconnected: function() {},

    followCurrentPost: function() {
      var postId;
      postId = this.collection().data('post-id');
      if (postId) {
        return this.perform('follow', {
          post_id: postId
        });
      } else {
        return this.perform('unfollow');
      }
    },

    received: function(data) {
      switch (data['action']) {
        case 'create':
          return this.collection().prepend(data['comment']);
        case 'delete':
          return this.collection().find('#comment-' + data['comment_id']).remove();
        default:
          return null;
      }
    }
  });

}).call(this);
