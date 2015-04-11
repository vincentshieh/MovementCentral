MovementCentral.Views.PostShow = Backbone.View.extend({
  template: JST['posts/show'],

  events: {
    'click .like': 'handleLikeClick'
  },

  initialize: function (options) {
    this.friendships = options.friendships;
    this.post_likes = options.post_likes;

    this.listenTo(this.post_likes, 'sync add remove', this.render);
  },

  handleLikeClick: function (event) {
    var post_id = this.model.get('id');
    var current_user_id = MovementCentral.current_user.id;
    var like;
    var view = this;

    if (this.liked()) {
      like = this.post_likes.findWhere({
        user_id: current_user_id,
        likable_id: post_id
      });
      like.destroy();
    } else {
      like = new MovementCentral.Models.Like({
        user_id: current_user_id,
        likable_type: 'Post',
        likable_id: post_id
      });
      like.save({}, {
        success: function () {
          view.post_likes.add(like);
        }
      });
    }
  },

  liked: function () {
    var like = this.post_likes.findWhere({
      user_id: MovementCentral.current_user.id,
      likable_id: this.model.get('id')
    });

    return like ? true : false;
  },

  numLikes: function () {
    var post_likes = this.post_likes;

    for(var i = 0, count = 0; i < post_likes.length; i++) {
      if (post_likes.models[i].get('likable_id') === this.model.get('id')) {
        count++;
      }
    }

    return count;
  },

  render: function () {
    var renderedContent = this.template({
      post: this.model,
      author: this.friendships.findWhere({
        user_id: parseInt(this.model.get('author_id'))
      }),
      recipient: this.friendships.findWhere({
        user_id: parseInt(this.model.get('recipient_id'))
      }),
      liked: this.liked(),
      numLikes: this.numLikes()
    });
    
    this.$el.html(renderedContent);
    return this;
  }
});
