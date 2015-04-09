MovementCentral.Collections.Posts = Backbone.Collection.extend({
  comparator: 'created_at',
  model: MovementCentral.Models.Post,
  url: 'api/posts'
});

MovementCentral.Collections.posts = new MovementCentral.Collections.Posts();
