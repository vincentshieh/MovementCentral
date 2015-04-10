MovementCentral.Views.PostForm = Backbone.View.extend({
  template: JST['posts/form'],

  events: {
    'click .create-post': 'submit',
    'click .add-photo': 'addPhoto'
  },

  initialize: function (options) {
    this.user_id = options.user_id;
    this.feed = options.feed;
  },

  addPhoto: function (event) {
    event.preventDefault();
    var view = this;

    filepicker.pick(
      {
        mimetypes: ['image/*'],
        services: ['COMPUTER']
      },
      function (Blob) {
        view.model.set({ picture: Blob.url });
      }
    );
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
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
        if (view.feed) {
          Backbone.history.navigate("/", { trigger: true });
        } else {
          Backbone.history.navigate("#users/" + view.user_id, { trigger: true });
        }
      }
    });
  }
});
