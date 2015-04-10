MovementCentral.Views.ProfileShow = Backbone.CompositeView.extend({
  template: JST['profile/show'],

  events: {
    'click .friend-button': 'handleFriendClick'
  },

  initialize: function (options) {
    this.user_id = options.user_id;
    this.friendships = options.friendships;
    this.listenTo(this.friendships, 'sync add remove', this.render);
  },

  friendButtonVal: function () {
    var user_id = this.user_id;

    for(var i = 0; i < this.friendships.length; i++) {
      var friendship = this.friendships.models[i];
      if (friendship.escape('user_id') === user_id &&
          user_id !== MovementCentral.current_user.id) {
        if (friendship.escape('accepted')) {
          return "Unfriend";
        } else {
          return friendship.escape('requester') ? "Friend Request Sent" : "Respond to Friend Request";
        }
      }
    }

    if (user_id === MovementCentral.current_user.id) {
      return "";
    } else {
      return "Add Friend";
    }
  },

  handleFriendClick: function (event) {
    var friendButtonVal = $(event.currentTarget).text();
    var view = this;
    var friendship;

    if (friendButtonVal === "Add Friend") {
      friendship = new MovementCentral.Models.Friendship({
        requester_id: MovementCentral.current_user.id,
        requestee_id: this.user_id
      });
      friendship.save({}, {
        success: function () {
          view.friendships.add(friendship);
          view.friendships.fetch();
          Backbone.history.navigate("#users/" + view.user_id, { trigger: true });
        }
      });
    } else if (friendButtonVal === "Unfriend") {
      friendship = this.friendships.findWhere({ user_id: this.user_id });
      friendship.destroy();
    }
  },

  render: function () {
    var renderedContent = this.template({
      friendship: this.friendships.findWhere({ user_id: this.user_id }),
      friend_button_val: this.friendButtonVal()
    });
    this.$el.html(renderedContent);
    this.renderPostForm();
    this.renderPostsIndex();
    if (this.user_id === MovementCentral.current_user.id) {
      this.renderFriendRequestsShow();
    }
    return this;
  },

  renderPostForm: function () {
    var formView = new MovementCentral.Views.PostForm({
      collection: this.collection,
      model: new MovementCentral.Models.Post({
        recipient_id: this.user_id
      }),
      user_id: this.user_id
    });
    this.unshiftSubview('.new-post', formView);
  },

  renderPostsIndex: function () {
    var indexView = new MovementCentral.Views.PostsIndex({
      collection: this.collection,
      user_id: this.user_id,
      friendship: this.friendships.findWhere({ user_id: this.user_id }),
      friendships: this.friendships
    });
    this.unshiftSubview('.received-posts', indexView);
  },

  renderFriendRequestsShow: function () {
    var showView = new MovementCentral.Views.FriendRequestsShow({
      collection: this.friendships,
      user_id: this.user_id
    });
    this.unshiftSubview('.friend-requests', showView);
  }
});
