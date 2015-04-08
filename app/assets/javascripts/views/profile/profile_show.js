MovementCentral.Views.ProfileShow = Backbone.CompositeView.extend({
  template: JST['profile/show'],

  initialize: function (options) {
    this.listenTo(this.collection, 'sync', this.render);
    this.listenTo(this.collection, 'add', this.renderPostForm);
    this.user_id = options.user_id;
  },

  render: function () {
    var renderedContent = this.template({
      user_id: this.user_id
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
    this.addSubview('.new-post', formView);
  },

  renderPostsIndex: function () {
    var indexView = new MovementCentral.Views.PostsIndex({
      collection: this.collection,
      user_id: this.user_id
    });
    this.addSubview('.received-posts', indexView);
  }
});
