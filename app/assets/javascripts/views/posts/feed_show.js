MovementCentral.Views.FeedShow = Backbone.CompositeView.extend({
  template: JST['feed/show'],

  initialize: function (options) {
    this.friendships = options.friendships;
    this.comment_likes = options.comment_likes;
    this.post_likes = options.post_likes;
    this.listenTo(this.collection, 'sync', this.render);
    this.listenTo(this.friendships, 'sync', this.render);
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.renderPostForm();
    this.renderPostsIndex();
    return this;
  },

  renderPostForm: function () {
    var formView = new MovementCentral.Views.PostForm({
      collection: this.collection,
      model: new MovementCentral.Models.Post({
        recipient_id: MovementCentral.current_user.id
      }),
      user_id: MovementCentral.current_user.id,
      is_feed: true
    });
    this.unshiftSubview('.new-post', formView);
  },

  renderPostsIndex: function () {
    var indexView = new MovementCentral.Views.PostsIndex({
      collection: this.collection,
      friendships: this.friendships,
      comment_likes: this.comment_likes,
      post_likes: this.post_likes,
      is_feed: true
    });
    this.unshiftSubview('.feed-posts', indexView);
  }
});
