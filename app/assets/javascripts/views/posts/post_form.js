MovementCentral.Views.PostForm = Backbone.View.extend({
  template: JST['posts/form'],

  render: function () {
    var renderedContent = this.template({
      post: this.model
    });

    this.$el.html(renderedContent);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var attrs = $(event.currentTarget).serializeJSON(),
      view = this;

    this.model.set(attrs);
    this.model.save({}, {
      success: function () {
        view.collection.add(view.model, { merge: true });
        Backbone.history.navigate("", { trigger: true });
      }
    });
  }
});
