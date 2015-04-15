MovementCentral.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    '': 'feedShow',
    'users/:id': 'timelineShow',
    'users/:id/about': 'aboutShow',
    'users/:id/friends': 'friendsShow'
  },

  aboutShow: function (id) {
    var friendships = MovementCentral.Collections.friendships;

    friendships.fetch();

    var aboutView = new MovementCentral.Views.ProfileShow({
      friendships: friendships,
      user_id: parseInt(id),
      subviewType: 'about'
    });

    this._swapView(aboutView);
  },

  feedShow: function () {
    var posts = MovementCentral.Collections.posts;
    var friendships = MovementCentral.Collections.friendships;
    var comment_likes = MovementCentral.Collections.comment_likes;
    var post_likes = MovementCentral.Collections.post_likes;

    posts.fetch({
      url: 'api/posts/feed'
    });
    friendships.fetch();
    comment_likes.fetch({
      url: 'api/likes/comment_index'
    });
    post_likes.fetch({
      url: 'api/likes/post_index'
    });

    var feedView = new MovementCentral.Views.FeedShow({
      collection: posts,
      friendships: friendships,
      comment_likes: comment_likes,
      post_likes: post_likes
    });

    this._swapView(feedView);
  },

  friendsShow: function (id) {
    var friendships = MovementCentral.Collections.friendships;

    friendships.fetch();

    var friendsView = new MovementCentral.Views.ProfileShow({
      friendships: friendships,
      user_id: parseInt(id),
      subviewType: 'friends'
    });

    this._swapView(friendsView);
  },

  timelineShow: function (id) {
    var posts = MovementCentral.Collections.posts;
    var friendships = MovementCentral.Collections.friendships;
    var comment_likes = MovementCentral.Collections.comment_likes;
    var post_likes = MovementCentral.Collections.post_likes;

    posts.fetch({
      data: {
        user_id: id
      }
    });
    friendships.fetch();
    comment_likes.fetch({
      url: 'api/likes/comment_index'
    });
    post_likes.fetch({
      url: 'api/likes/post_index'
    });

    var timelineView = new MovementCentral.Views.ProfileShow({
      posts: posts,
      user_id: parseInt(id),
      friendships: friendships,
      comment_likes: comment_likes,
      post_likes: post_likes,
      subviewType: 'timeline'
    });

    this._swapView(timelineView);
  },

  _swapView: function (newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;
    this.$rootEl.html(newView.render().$el);
    $(document).scrollTop(0);
  }
});
