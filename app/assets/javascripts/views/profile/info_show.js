MovementCentral.Views.InfoShow = Backbone.View.extend({
  template: JST['profile/info'],

  render: function () {
    var renderedContent = this.template({
      friendship: this.model
    });
    this.$el.html(renderedContent);
    return this;
  }
});
