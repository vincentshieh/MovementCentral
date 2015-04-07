MovementCentral.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    '': 'profile'
  },

  profile: function () {
    var posts = MovementCentral.Collections.posts;
    posts.fetch();

    var profile = new MovementCentral.Views.Profile({
      collection: posts
    });

    this._swapView(profile);
  },

  _swapView: function (newView) {
    this._currentView && this._currentView.remove();
    this._currentView = newView;
    $rootEl.html(newView.render().$el);
  }
});
