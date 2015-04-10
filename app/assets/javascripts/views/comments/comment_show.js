MovementCentral.Views.CommentShow = Backbone.View.extend({
  template: JST['comments/show'],

  initialize: function (options) {
    this.friendships = options.friendships;
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var renderedContent = this.template({
      comment: this.model,
      author: this.friendships.findWhere({
        user_id: parseInt(this.model.get('author_id'))
      })
    });
    this.$el.html(renderedContent);
    return this;
  },
});
