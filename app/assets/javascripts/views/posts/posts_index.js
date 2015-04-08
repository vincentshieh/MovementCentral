MovementCentral.Views.PostsIndex = Backbone.View.extend({
  template: JST['posts/index'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);
  },

  render: function () {
    var renderedContent = this.template({
      posts: this.collection
    });
    debugger
    this.$el.html(renderedContent);
    return this;
  }
});
