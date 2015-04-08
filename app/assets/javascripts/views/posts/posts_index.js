MovementCentral.Views.PostsIndex = Backbone.CompositeView.extend({
  template: JST['posts/index'],

  initialize: function (options) {
    this.user_id = options.user_id;

    this.listenTo(this.collection, 'sync', this.render);
  },

  addPost: function (post) {
    var showView = new MovementCentral.Views.PostShow({
      model: post
    });
    this.addSubview('.posts', showView);
  },

  render: function () {
    var renderedContent = this.template({
      posts: this.collection,
      user_id: this.user_id
    });
    this.$el.html(renderedContent);
    this.renderPosts();
    return this;
  },

  renderPosts: function () {
    this.collection.each(this.addPost.bind(this));
  }
});
