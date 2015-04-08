MovementCentral.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    'users/:id': 'profile'
  },

  profile: function (id) {
    var posts = MovementCentral.Collections.posts;
    posts.fetch();

    var profile = new MovementCentral.Views.Profile({
      collection: posts,
      id: id
    });

    this._swapView(profile);
  },

  _swapView: function (newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;
    $rootEl.html(newView.render().$el);
  }
});
