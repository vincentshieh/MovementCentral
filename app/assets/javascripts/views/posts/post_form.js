MovementCentral.Views.PostForm = Backbone.View.extend({
  template: JST['posts/form'],

  events: {
    'click .create-post': 'submit',
    'click .add-photo': 'addPhoto'
  },

  initialize: function (options) {
    this.user_id = options.user_id;
    this.is_feed = options.is_feed;
    this.listenTo(this.model, 'error', this.renderErrors);
  },

  addPhoto: function (event) {
    event.preventDefault();
    var view = this;
    var $filename = this.$('.photo-filename');

    filepicker.pick(
      {
        mimetypes: ['image/*'],
        services: ['COMPUTER']
      },
      function (Blob) {
        view.model.set({ picture: Blob.url });
        $filename.html(Blob.filename);
      }
    );
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
      error_alert = '<div class="alert alert-danger post-error" role="alert">' +
                    errors[i] + '</div>';
      this.$el.prepend(error_alert);
    }

    setTimeout(function () {
      view.$('.post-error').remove();
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
        view.model = new MovementCentral.Models.Post({
          recipient_id: view.user_id
        });
        view.$('.post-content').val("");
        if (view.is_feed || !view.user_id) {
          Backbone.history.navigate("/", { trigger: true });
        } else {
          Backbone.history.navigate("#/users/" + view.user_id, { trigger: true });
        }
      }
    });
  }
});
