MovementCentral.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    '': 'profileShow',
    'users/:id': 'profileShow'
  },

  profileShow: function (id) {
    var posts = MovementCentral.Collections.posts;
    var friendships = MovementCentral.Collections.friendships;
    id = id || MovementCentral.current_user.id;

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
