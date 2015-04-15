MovementCentral.Views.FriendsShow = Backbone.View.extend({
  template: JST['friendships/friends_show'],

  events: {
    'click .friend-item': 'handleFriendItemClick'
  },

  initialize: function (options) {
    this.user_id = options.user_id;
    this.collection.fetch({
      url: 'api/friendships/friends',
      data: {
        user_id: this.user_id
      }
    });
    this.listenTo(this.collection, 'sync', this.render);
  },

  handleFriendItemClick: function (event) {
    $target = $(event.currentTarget);
    var user_id = $target.data('user-id');
    Backbone.history.navigate("#/users/" + user_id, { trigger: true });
  },

  render: function () {
    var renderedContent = this.template({
      friends: this.collection,
    });
    this.$el.html(renderedContent);
    return this;
  }
});
