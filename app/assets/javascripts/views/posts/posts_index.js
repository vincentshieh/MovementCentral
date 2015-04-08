MovementCentral.Views.PostsIndex = Backbone.CompositeView.extend({
  template: JST['posts/index'],

  initialize: function (options) {
    this.user_id = options.user_id;
    this.listenTo(this.collection, 'sync', this.render);
  },

  addPostItem: function (post) {
    var itemView = new MovementCentral.Views.PostsIndexItem({
      model: post
    });
    this.addSubview('.posts', itemView);
  },

  render: function () {
    var renderedContent = this.template({
      posts: this.collection,
      user_id: this.user_id
    });
    this.$el.html(renderedContent);
    this.renderPostItems();
    return this;
  },

  renderPostItems: function () {
    this.collection.each(this.addPostItem.bind(this));
  }
});
