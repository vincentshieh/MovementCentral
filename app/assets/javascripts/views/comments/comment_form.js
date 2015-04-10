MovementCentral.Views.CommentForm = Backbone.View.extend({
  template: JST['comments/form'],

  events: {
    'click button': 'submit'
  },

  initialize: function (options) {
    this.post_id = this.model.escape('post_id');
    this.user_id = options.user_id;
    this.listenTo(this.model, 'sync', this.render);
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var attrs = this.$('form').serializeJSON(),
      view = this;

    this.model.set(attrs);
    this.model.save({}, {
      success: function () {
        view.collection.add(view.model, { merge: true });
        view.model = new MovementCentral.Models.Comment({
          post_id: view.post_id
        });
        view.$('.comment-content').val("");
        Backbone.history.navigate("#users/" + view.user_id, { trigger: true });
      }
    });
  }
});
