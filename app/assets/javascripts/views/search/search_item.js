MovementCentral.Views.SearchItem = Backbone.View.extend({
  template: JST['search/item'],

  className: 'search-item',

  render: function () {
    var renderedContent = this.template({
      user: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});
