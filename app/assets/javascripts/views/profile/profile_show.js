MovementCentral.Views.ProfileShow = Backbone.CompositeView.extend({
  template: JST['profile/show'],

  events: {
    'click .friend-button': 'handleFriendClick'
  },

  initialize: function (options) {
    this.posts = options.posts;
    this.user_id = options.user_id;
    this.friendships = options.friendships;
    this.comment_likes = options.comment_likes;
    this.post_likes = options.post_likes;
    this.subviewType = options.subviewType;
    this.searchFormView = new MovementCentral.Views.SearchForm({
      collection: MovementCentral.Collections.search_results
    });
    if (this.subviewType === 'timeline') {
      this.listenTo(this.posts, 'sync', this.render);
    }
    this.listenTo(this.friendships, 'sync', this.render);
  },

  friendButtonVal: function () {
    var user_id = this.user_id;
    var friendship = this.friendships.findWhere({ user_id: user_id });
    if (!friendship) {
      return "";
    }
    if (friendship.get('stranger')) {
      return "Add Friend";
    } else if (friendship.get('self')) {
      return "";
    } else {
      if (friendship.get('accepted')) {
        return "Unfriend";
      } else {
        return friendship.get('requester') ? "Friend Request Sent" : "Respond to Friend Request";
      }
    }
  },

  handleFriendClick: function (event) {
    var friendButtonVal = $(event.currentTarget).text().trim();
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
          Backbone.history.navigate("#/users/" + view.user_id, { trigger: true });
        }
      });
    } else if (friendButtonVal === "Unfriend") {
      friendship = this.friendships.findWhere({ user_id: this.user_id });
      friendship.destroy({
        success: function () {
          view.friendships.fetch();
        }
      });
    }
  },

  render: function () {
    var friendship = this.friendships.findWhere({ user_id: this.user_id });
    var show_info;
    if (friendship) {
      show_info = friendship.get('accepted') || friendship.get('self');
    }
    var renderedContent = this.template({
      friendship: friendship,
      friend_button_val: this.friendButtonVal(),
      show_info: show_info,
      subviewType: this.subviewType
    });
    this.$el.html(renderedContent);
    this.renderSearchForm();
    if (this.subviewType === 'timeline') {
      this.renderPostForm();
      this.renderPostsIndex();
      if (this.user_id === MovementCentral.current_user.id) {
        this.renderFriendRequestsShow();
      }
    } else if (this.subviewType === 'about') {
      this.renderAboutShow();
    } else if (this.subviewType === 'friends') {
      this.renderFriendsShow();
    }

    return this;
  },

  renderAboutShow: function () {
    var showView = new MovementCentral.Views.AboutShow({
      collection: this.friendships,
      user_id: this.user_id
    });
    this.unshiftSubview('.about', showView);
  },

  renderFriendsShow: function () {
    var showView = new MovementCentral.Views.FriendsShow({
      collection: new MovementCentral.Collections.Friendships(),
      user_id: this.user_id
    });
    this.unshiftSubview('.friends', showView);
  },

  renderPostForm: function () {
    var formView = new MovementCentral.Views.PostForm({
      collection: this.posts,
      model: new MovementCentral.Models.Post({
        recipient_id: this.user_id
      }),
      user_id: this.user_id
    });
    this.unshiftSubview('.new-post', formView);
  },

  renderPostsIndex: function () {
    var indexView = new MovementCentral.Views.PostsIndex({
      collection: this.posts,
      user_id: this.user_id,
      friendship: this.friendships.findWhere({ user_id: this.user_id }),
      friendships: this.friendships,
      comment_likes: this.comment_likes,
      post_likes: this.post_likes
    });
    this.unshiftSubview('.received-posts', indexView);
  },

  renderFriendRequestsShow: function () {
    var showView = new MovementCentral.Views.FriendRequestsShow({
      collection: this.friendships,
      user_id: this.user_id
    });
    this.unshiftSubview('.friend-requests', showView);
  },

  renderSearchForm: function () {
    $(".search-form").html(this.searchFormView.render().$el);
  }
});
