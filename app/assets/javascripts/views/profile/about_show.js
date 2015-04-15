MovementCentral.Views.AboutShow = Backbone.View.extend({
  template: JST['profile/about'],

  initialize: function (options) {
    this.friendship = options.friendship;
    this.user_id = options.user_id;
  },

  render: function () {
    var friendship = this.friendship;
    var show_info;
    if (friendship) {
      show_info = friendship.get('self') || friendship.get('accepted') ||
                  (!friendship.get('stranger') &&
                   !friendship.get('requester'));
    }
    var renderedContent = this.template({
      friendship: friendship,
      show_info: show_info
    });
    this.$el.html(renderedContent);
    return this;
  }
});
