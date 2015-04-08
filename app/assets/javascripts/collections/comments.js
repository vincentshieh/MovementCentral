MovementCentral.Collections.Comments = Backbone.Collection.extend({
  comparator: 'created_at',
  model: MovementCentral.Models.Comment,
  url: 'api/comments',

  initialize: function (models, options) {
    this.post = options.post;
  }
});

// MovementCentral.Collections.comments = new MovementCentral.Collections.Comments();
