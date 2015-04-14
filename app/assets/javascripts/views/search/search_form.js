MovementCentral.Views.SearchForm = Backbone.CompositeView.extend({
  template: JST['search/form'],

  initialize: function (options) {
    this.listenTo(this.collection, 'sync', this.renderSearchItems);
  },

  addSearchItem: function (user) {
    var itemView = new MovementCentral.Views.SearchItem({
      model: user
    });
    this.pushSubview('.search-items', itemView);
  },

  render: function () {
    var renderedContent = this.template();
    var view = this;
    this.$el.html(renderedContent);
    this.renderSearchItems();

    setTimeout(function () {
      this.$('.search-query').off('input');
      this.$('.search-query').on('input', function() {
        view.collection.fetch({
          url: 'api/users/search',
          data: {
            query: view.$('.search-query').val()
          }
        });
      });
    }, 0);

    return this;
  },

  renderSearchItems: function () {
    this.$('.search-items').empty();
    this.collection.each(this.addSearchItem.bind(this));
  }
});
