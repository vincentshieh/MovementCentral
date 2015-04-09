MovementCentral.Views.PostsIndexItem = Backbone.CompositeView.extend({
  template: JST['posts/index_item'],

  initialize: function (options) {
    this.collection = this.model.comments();
    this.user_id = options.user_id;
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.collection, 'add', this.addComment);
  },

  addComment: function (comment) {
    var showView = new MovementCentral.Views.CommentShow({
      model: comment
    });
    this.pushSubview('.comments', showView);
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.renderPost();
    this.renderComments();
    this.renderCommentForm();
    return this;
  },

  renderPost: function () {
    var showView = new MovementCentral.Views.PostShow({
      model: this.model
    });
    this.unshiftSubview('.post', showView);
  },

  renderComments: function () {
    this.collection.each(this.addComment.bind(this));
  },

  renderCommentForm: function () {
    var formView = new MovementCentral.Views.CommentForm({
      collection: this.model.comments(),
      model: new MovementCentral.Models.Comment({
        post_id: this.model.id
      }),
      user_id: this.user_id
    });
    this.unshiftSubview('.new-comment', formView);
  }
});
