MovementCentral.Views.FriendRequestsShow = Backbone.View.extend({
  template: JST['friendships/requests_show'],

  events: {
    'click .accept-friend-request': 'acceptFriendRequest'
  },

  acceptFriendRequest: function (event) {
    var $target = $(event.currentTarget);
    var friend_id = $target.data('friend-id');
    var friendship = this.collection.findWhere({ user_id: friend_id });
    friendship.save({ accepted: true });
  },

  render: function () {
    var renderedContent = this.template({
      friend_requests: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  }
});
