MovementCentral.Views.PostShow = Backbone.View.extend({
  template: JST['posts/show'],

  events: {
    'click .post-like': 'handleLikeClick'
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
      ga('send', 'event', 'posts', 'unlike');
      like = this.post_likes.findWhere({
        user_id: current_user_id,
        likable_id: post_id
      });
      like.destroy();
    } else {
      ga('send', 'event', 'posts', 'like');
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

  likers: function () {
    this._likers = new MovementCentral.Collections.Friendships();
    var post_likes = this.post_likes;
    var friendship;

    for(var i = 0; i < post_likes.length; i++) {
      if (post_likes.models[i].get('likable_id') === this.model.get('id')) {
        friendship = this.friendships.findWhere({
          user_id: post_likes.models[i].get('user_id')
        });
        this._likers.add(friendship);
      }
    }

    return this._likers;
  },

  likersString: function () {
    var result = "";
    var likers = this.likers();
    var numLikers = likers.length;
    var current_user_id = MovementCentral.current_user.id;
    var liker1, liker2, liker3;

    if (numLikers === 0) {
      return result;
    } else if (numLikers === 1) {
      liker1 = likers.models[0];

      if (liker1.get('user_id') === current_user_id) {
        result = "You like this.";
      } else {
        result = liker1.get('fname') + " " +
                 liker1.get('lname') + " likes this";
      }
    } else if (numLikers === 2) {
      liker1 = likers.models[0];
      liker2 = likers.models[1];
      if (liker1.get('user_id') === current_user_id) {
        result = "You and " + liker2.get('fname') + " " +
                              liker2.get('lname') + " like this.";
      } else if (liker2.get('user_id') === current_user_id) {
        result = "You and " + liker1.get('fname') + " " +
                              liker1.get('lname') + " like this.";
      } else {
        result = liker1.get('fname') + " " + liker1.get('lname') +
                 " and " +
                 liker2.get('fname') + " " + liker2.get('lname') +
                 " like this.";
      }
    } else if (numLikers === 3) {
      liker1 = likers.models[0];
      liker2 = likers.models[1];
      liker3 = likers.models[2];

      if (liker1.get('user_id') === current_user_id) {
        result = "You, " + liker2.get('fname') + " " +
                           liker2.get('lname') + " and " +
                           liker3.get('fname') + " " +
                           liker3.get('lname') + " like this.";
      } else if (liker2.get('user_id') === current_user_id) {
        result = "You, " + liker1.get('fname') + " " +
                           liker1.get('lname') + " and " +
                           liker3.get('fname') + " " +
                           liker3.get('lname') + " like this.";
      } else if (liker3.get('user_id') === current_user_id) {
        result = "You, " + liker1.get('fname') + " " +
                           liker1.get('lname') + " and " +
                           liker2.get('fname') + " " +
                           liker2.get('lname') + " like this.";
      } else {
        result = liker1.get('fname') + " " + liker1.get('lname') +
                 ", " +
                 liker2.get('fname') + " " + liker2.get('lname') +
                 " and " +
                 liker3.get('fname') + " " + liker3.get('lname') +
                 " like this.";
      }
    } else {
      liker1 = likers.models[0];
      liker2 = likers.models[1];
      liker3 = likers.models[2];
      var endString = (numLikers === 4) ?
        " and 1 other person like this." :
        " and " + (numLikers - 3) + " others like this.";

      if (liker1.get('user_id') === current_user_id) {
        result = "You, " + liker2.get('fname') + " " +
                           liker2.get('lname') + ", " +
                           liker3.get('fname') + " " +
                           liker3.get('lname') + endString;
      } else if (liker2.get('user_id') === current_user_id) {
        result = "You, " + liker1.get('fname') + " " +
                           liker1.get('lname') + ", " +
                           liker3.get('fname') + " " +
                           liker3.get('lname') + endString;
      } else if (this.liked()) {
        result = "You, " + liker1.get('fname') + " " +
                           liker1.get('lname') + ", " +
                           liker2.get('fname') + " " +
                           liker2.get('lname') + endString;
      } else {
        result = liker1.get('fname') + " " + liker1.get('lname') +
                 ", " +
                 liker2.get('fname') + " " + liker2.get('lname') +
                 ", " +
                 liker3.get('fname') + " " + liker3.get('lname') +
                 endString;
      }
    }

    return result;
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
      likers: this.likersString()
    });

    this.$el.html(renderedContent);
    return this;
  }
});
