MovementCentral.Views.FriendRequestsShow = Backbone.View.extend({
  template: JST['friendships/requests_show'],

  events: {
    'click .accept-friend-request': 'acceptFriendRequest',
    'click .delete-friend-request': 'deleteFriendRequest'
  },

  initialize: function (options) {
    this.friendships = options.friendships;
  },

  acceptFriendRequest: function (event) {
    ga('send', 'event', 'friendships', 'accept');
    var $target = $(event.currentTarget);
    var friend_id = $target.data('friend-id');
    var friendship = this.collection.findWhere({ user_id: friend_id });
    friendship.save({ accepted: true });
  },

  deleteFriendRequest: function (event) {
    ga('send', 'event', 'friendships', 'reject');
    var $target = $(event.currentTarget);
    var friend_id = $target.data('friend-id');
    var friendship = this.collection.findWhere({ user_id: friend_id });
    var view = this;
    friendship.destroy({
      success: function () {
        view.friendships.fetch();
      }
    });
  },

  render: function () {
    var renderedContent = this.template({
      friend_requests: this.collection
    });
    this.$el.html(renderedContent);
    return this;
  }
});
