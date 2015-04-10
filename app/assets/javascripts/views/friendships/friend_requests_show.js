MovementCentral.Views.FriendRequestsShow = Backbone.View.extend({
  template: JST['friendships/requests_show'],

  events: {
    'click .accept-friend-request': 'acceptFriendRequest'
  },

  initialize: function (options) {
    this.user_id = options.user_id;
    this.listenTo(this.collection, 'change:accepted', this.render);
  },

  acceptFriendRequest: function (event) {
    var $target = $(event.currentTarget);
    var friend_id = $target.data('friend-id');
    var friendship = this.collection.findWhere({ user_id: friend_id });
    friendship.save({ accepted: true });
  },

  render: function () {
    var friendships = this.collection;
    var friend_requests = new MovementCentral.Collections.Friendships();
    for(var i = 0; i < friendships.length; i++) {
      if (!friendships.models[i].get('self') &&
          !friendships.models[i].get('stranger') &&
          !friendships.models[i].get('requester') &&
          !friendships.models[i].get('accepted')) {
        friend_requests.add(friendships.models[i]);
      }
    }
    var renderedContent = this.template({
      friend_requests: friend_requests
    });
    this.$el.html(renderedContent);
    return this;
  }
});
