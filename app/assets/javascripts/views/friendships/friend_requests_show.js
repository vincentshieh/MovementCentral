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
    var friendship = new MovementCentral.Models.Friendship({
      requester_id: friend_id,
      requestee_id: this.user_id,
      accepted: true
    });

    friendship.save({}, { patch: true });
  },

  render: function () {
    var friendships = this.collection;
    var friend_requests = new MovementCentral.Collections.Friendships();
    for(var i = 0; i < friendships.length; i++) {
      if (!friendships.models[i].get('requester')) {
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
