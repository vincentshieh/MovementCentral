MovementCentral.Views.Profile = Backbone.CompositeView.extend({
  template: JST['profile/profile'],

  initialize: function () {
    this.listenTo(this.collection, 'sync', this.render);

    var formView = new MovementCentral.Views.PostForm({
      collection: this.collection,
      model: new MovementCentral.Models.Post()
    });
    var indexView = new MovementCentral.Views.PostsIndex({
      collection: this.collection
    });

    this.addSubview('.new-post', formView);
    this.addSubview('.received-posts', indexView);
  },

  render: function () {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    this.attachSubviews();
    return this;
  }
});
