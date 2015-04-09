MovementCentral.Views.ProfileShow = Backbone.CompositeView.extend({
  template: JST['profile/show'],

  initialize: function (options) {
    this.user_id = options.user_id;
    this.friendships = options.friendships;
    this.listenTo(this.friendships, 'sync', this.render);
  },

  friendButton: function () {
    var user_id = this.user_id;

    for(var i = 0; i < this.friendships.length; i++) {
      var friendship = this.friendships.models[i];
      if (friendship.get('user_id') === user_id) {
        if (friendship.get('accepted')) {
          return "Friends";
        } else {
          return "Friend Request Sent";
        }
      }
    }

    if (user_id === MovementCentral.current_user_id) {
      return "";
    } else {
      return "Add Friend";
    }
  },

  render: function () {
    var renderedContent = this.template({
      user_id: this.user_id,
      friend_button: this.friendButton()
    });
    this.$el.html(renderedContent);
    this.renderPostForm();
    this.renderPostsIndex();
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
    });
    this.unshiftSubview('.received-posts', indexView);
  }
});
