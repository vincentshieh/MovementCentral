MovementCentral.Views.CommentShow = Backbone.View.extend({
  template: JST['comments/show'],

  events: {
    'click .like': 'handleLikeClick'
  },

  initialize: function (options) {
    this.friendships = options.friendships;
    this.comment_likes = options.comment_likes;
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.comment_likes, 'sync add remove', this.render);
  },

  handleLikeClick: function (event) {
    var $target = $(event.currentTarget);
    var commentId = this.model.get('id');
    var current_user_id = MovementCentral.current_user.id;
    var like;
    var view = this;
    if (this.liked()) {
      like = this.comment_likes.findWhere({
        user_id: current_user_id,
        likable_id: commentId
      });
      like.destroy();
    } else {
      like = new MovementCentral.Models.Like({
        user_id: current_user_id,
        likable_type: 'Comment',
        likable_id: commentId
      });
      like.save({}, {
        success: function () {
          view.comment_likes.add(like);
        }
      });
    }
  },

  liked: function () {
    var like = this.comment_likes.findWhere({
      user_id: MovementCentral.current_user.id,
      likable_id: this.model.get('id')
    });
    return like ? true : false;
  },

  numLikes: function () {
    var comment_likes = this.comment_likes;
    for(var i = 0, count = 0; i < comment_likes.length; i++) {
      if (comment_likes.models[i].get('likable_id') === this.model.get('id')) {
        count++;
      }
    }
    return count;
  },

  render: function () {
    var renderedContent = this.template({
      comment: this.model,
      author: this.friendships.findWhere({
        user_id: parseInt(this.model.get('author_id'))
      }),
      liked: this.liked(),
      numLikes: this.numLikes()
    });
    this.$el.html(renderedContent);
    return this;
  }
});
