MovementCentral.Views.PostShow = Backbone.View.extend({
  template: JST['posts/show'],

  initialize: function (options) {
    this.friendships = options.friendships;
  },

  render: function () {
    var renderedContent = this.template({
      post: this.model,
      author: this.friendships.findWhere({
        user_id: parseInt(this.model.get('author_id'))
      }),
      recipient: this.friendships.findWhere({
        user_id: parseInt(this.model.get('recipient_id'))
      })
    });
    this.$el.html(renderedContent);
    return this;
  },
});
