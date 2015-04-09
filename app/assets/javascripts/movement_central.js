window.MovementCentral = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new MovementCentral.Routers.Router({
      $rootEl: $("#main")
    });
    Backbone.history.start();
  }
};
