MovementCentral.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    '': 'feedShow',
    'users/:id': 'profileShow'
  },

  feedShow: function () {
    var posts = MovementCentral.Collections.posts;
    var friendships = MovementCentral.Collections.friendships;

    posts.fetch({
      url: 'api/posts/feed'
    });
    friendships.fetch();

    var feedView = new MovementCentral.Views.FeedShow({
      collection: posts,
      friendships: friendships
    });

    this._swapView(feedView);
  },

  profileShow: function (id) {
    var posts = MovementCentral.Collections.posts;
    var friendships = MovementCentral.Collections.friendships;

    posts.fetch({
      data: {
        user_id: id
      }
    });
    friendships.fetch();

    var profileView = new MovementCentral.Views.ProfileShow({
      collection: posts,
      user_id: parseInt(id),
      friendships: friendships
    });

    this._swapView(profileView);
  },

  _swapView: function (newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;
    this.$rootEl.html(newView.render().$el);
  }
});
