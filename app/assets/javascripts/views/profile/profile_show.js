MovementCentral.Views.ProfileShow = Backbone.CompositeView.extend({
  template: JST['profile/show'],

  events: {
    'click .friend-button': 'handleFriendClick',
    'click .subview-btn': 'handleSubviewClick',
    'click .change-profile-pic': 'changeProfilePic',
    'click .change-cover-photo': 'changeCoverPhoto'
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

  changeCoverPhoto: function (event) {
    ga('send', 'event', 'users', 'update_cover_photo');
    var current_user = new MovementCentral.Models.Friendship();
    var view = this;

    filepicker.pick(
      {
        mimetypes: ['image/*'],
        services: ['COMPUTER']
      },
      function (Blob) {
        current_user.save({ cover_photo: Blob.url }, {
          url: 'api/users/update_attribute',
          success: function () {
            view.friendships.fetch();
          }
        });
      }
    );
  },

  changeProfilePic: function (event) {
    ga('send', 'event', 'users', 'update_profile_picture');
    var current_user = new MovementCentral.Models.Friendship();
    var view = this;

    filepicker.pick(
      {
        mimetypes: ['image/*'],
        services: ['COMPUTER']
      },
      function (Blob) {
        current_user.save({ profile_picture: Blob.url }, {
          url: 'api/users/update_attribute',
          success: function () {
            location.reload();
          }
        });
      }
    );
  },

  friendButtonVal: function () {
    var friendship = this.friendships.findWhere({ user_id: this.user_id });
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
      ga('send', 'event', 'friendships', 'create');
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
      ga('send', 'event', 'friendships', 'destroy');
      friendship = this.friendships.findWhere({ user_id: this.user_id });
      friendship.destroy({
        success: function () {
          view.friendships.fetch();
        }
      });
    }
  },

  handleSubviewClick: function (event) {
    var subviewButtonVal = $(event.currentTarget).text().trim();

    if (subviewButtonVal === "Timeline") {
      Backbone.history.navigate("#/users/" + this.user_id, { trigger: true });
    } else if (subviewButtonVal === "About") {
      Backbone.history.navigate("#/users/" + this.user_id + "/about", { trigger: true });
    } else if (subviewButtonVal === "Friends") {
      Backbone.history.navigate("#/users/" + this.user_id + "/friends", { trigger: true });
    }
  },

  render: function () {
    var friendships = this.friendships;
    var friendship = friendships.findWhere({ user_id: this.user_id });
    var show_info, show_info_box, show_friend_requests;
    var friend_requests = new MovementCentral.Collections.Friendships();


    if (friendship) {
      show_info = friendship.get('self') || friendship.get('accepted') ||
                  (!friendship.get('stranger') &&
                   !friendship.get('requester'));

      show_info_box = (friendship.get('job_title') && friendship.get('company')) ||
                      (friendship.get('dance_style') && friendship.get('school')) ||
                      friendship.get('current_city') || friendship.get('hometown');

      if (friendship.get('self')) {
        for(var i = 0; i < friendships.length; i++) {
          if (!friendships.models[i].get('self') &&
              !friendships.models[i].get('stranger') &&
              !friendships.models[i].get('requester') &&
              !friendships.models[i].get('accepted')) {
            friend_requests.add(friendships.models[i]);
          }
        }
        show_friend_requests = friend_requests.length > 0;
      }
    }
    var renderedContent = this.template({
      friendship: friendship,
      friend_button_val: this.friendButtonVal(),
      show_info: show_info,
      show_info_box: show_info_box,
      show_friend_requests: show_friend_requests,
      subviewType: this.subviewType
    });
    this.$el.html(renderedContent);

    this.renderSearchForm();
    if (this.subviewType === 'timeline') {
      if (show_info) {
        if (show_info_box) {
          this.renderInfoShow();
        }
        this.renderPostForm();
        this.renderPostsIndex();
      }
      if (show_friend_requests) {
        this.renderFriendRequestsShow(friend_requests);
      }
    } else if (this.subviewType === 'about') {
      this.renderAboutShow();
    } else if (this.subviewType === 'friends' && show_info) {
      this.renderFriendsShow();
    }

    return this;
  },

  renderAboutShow: function () {
    var friendship;
    if (this.friendships) {
      friendship = this.friendships.findWhere({ user_id: this.user_id });
    }
    var showView = new MovementCentral.Views.AboutShow({
      friendship: friendship,
      friendships: this.friendships
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

  renderInfoShow: function () {
    var friendship;
    if (this.friendships) {
      friendship = this.friendships.findWhere({ user_id: this.user_id });
    }
    var showView = new MovementCentral.Views.InfoShow({
      model: friendship,
    });
    this.unshiftSubview('.user-info', showView);
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

  renderFriendRequestsShow: function (friend_requests) {
    var showView = new MovementCentral.Views.FriendRequestsShow({
      collection: friend_requests,
      friendships: this.friendships
    });
    this.unshiftSubview('.friend-requests', showView);
  },

  renderSearchForm: function () {
    $(".search-form").html(this.searchFormView.render().$el);
  }
});
