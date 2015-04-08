MovementCentral.Views.PostsIndexItem = Backbone.CompositeView.extend({
  template: JST['posts/index_item'],

  initialize: function (options) {
    this.user_id = options.user_id;
    this.listenTo(this.model, 'sync', this.render);
  },

  addComment: function (comment) {
    var showView = new MovementCentral.Views.CommentShow({
      model: comment
    });
    this.addSubview('.comments', showView);
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
    this.addSubview('.post', showView);
  },

  renderComments: function () {
    this.model.comments().each(this.addComment.bind(this));
  },

  renderCommentForm: function () {
    var formView = new MovementCentral.Views.CommentForm({
      model: new MovementCentral.Models.Comments({
        post_id: this.model.id
      })
    });
    this.addSubview('.new-comment', formView);
  }
});
