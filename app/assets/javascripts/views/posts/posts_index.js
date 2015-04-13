MovementCentral.Views.PostsIndex = Backbone.CompositeView.extend({
  template: JST['posts/index'],

  initialize: function (options) {
    this.user_id = options.user_id;
    this.friendship = options.friendship;
    this.friendships = options.friendships;
    this.comment_likes = options.comment_likes;
    this.post_likes = options.post_likes;
    this.is_feed = options.is_feed;
    this.listenTo(this.collection, 'sync', this.render);
  },

  addPostItem: function (post) {
    var itemView = new MovementCentral.Views.PostsIndexItem({
      model: post,
      collection: post.comments(),
      user_id: this.user_id,
      friendships: this.friendships,
      comment_likes: this.comment_likes,
      post_likes: this.post_likes,
      is_feed: this.is_feed
    });
    this.unshiftSubview('.posts', itemView);
  },

  render: function () {
    var renderedContent = this.template({
      posts: this.collection,
      friendship: this.friendship
    });
    this.$el.html(renderedContent);
    this.renderPostItems();
    return this;
  },

  renderPostItems: function () {
    this.collection.each(this.addPostItem.bind(this));
  }
});
