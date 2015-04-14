MovementCentral.Views.CommentForm = Backbone.View.extend({
  template: JST['comments/form'],

  events: {
    'click button': 'submit'
  },

  initialize: function (options) {
    this.post_id = this.model.get('post_id');
    this.user_id = options.user_id;
    this.is_feed = options.is_feed;
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model, 'error', this.renderErrors);
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  },

  renderErrors: function (post, resp) {
    var errors = resp.responseJSON;
    var error_message;
    var view = this;

    for(var i = 0; i < errors.length; i++) {
      error_alert = '<div class="alert alert-danger comment-error" role="alert">' +
                    errors[i] + '</div>';
      this.$el.prepend(error_alert);
    }

    setTimeout(function () {
      view.$('.comment-error').remove();
    }, 5000);
  },

  submit: function (event) {
    event.preventDefault();
    var attrs = this.$('form').serializeJSON();
    var view = this;

    this.model.set(attrs);
    this.model.save({}, {
      success: function () {
        view.collection.add(view.model, { merge: true });
        view.model = new MovementCentral.Models.Comment({
          post_id: view.post_id
        });
        view.$('.comment-content').val("");
        if (view.is_feed || !view.user_id) {
          Backbone.history.navigate("/", { trigger: true });
        } else {
          Backbone.history.navigate("#/users/" + view.user_id, { trigger: true });
        }
      }
    });
  }
});
