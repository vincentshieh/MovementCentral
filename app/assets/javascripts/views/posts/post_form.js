MovementCentral.Views.PostForm = Backbone.View.extend({
  template: JST['posts/form'],

  events: {
    'click .create-post': 'submit',
    'click .add-photo': 'addPhoto'
  },

  initialize: function (options) {
    this.user_id = options.user_id;
    this.is_feed = options.is_feed;
    this.is_current_user_profile = this.user_id === MovementCentral.current_user.id;
    this.listenTo(this.model, 'error', this.renderErrors);
  },

  addPhoto: function (event) {
    event.preventDefault();
    var view = this;
    var $photo_preview = this.$('.photo-preview');

    filepicker.pick(
      {
        mimetypes: ['image/*'],
        services: ['COMPUTER']
      },
      function (Blob) {
        view.model.set({ picture: Blob.url });
        $photo_preview.html("<div class='photo-preview-text'>Photo Preview:</div><img src='" + Blob.url + "'>");
      }
    );
  },

  render: function () {
    var renderedContent = this.template({
      is_feed: this.is_feed,
      is_current_user_profile: this.is_current_user_profile
    });
    this.$el.html(renderedContent);
    return this;
  },

  renderErrors: function (post, resp) {
    var errors = resp.responseJSON;
    var error_message;
    var view = this;

    for(var i = 0; i < errors.length; i++) {
      error_alert = '<div class="alert alert-danger post-error" role="alert"><span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><span class="sr-only">Error:</span> ' +
                    errors[i] + '</div>';
      this.$('form').prepend(error_alert);
    }

    setTimeout(function () {
      view.$('.post-error').remove();
    }, 3000);
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
      }
    });
  }
});
