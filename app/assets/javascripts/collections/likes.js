MovementCentral.Collections.Likes = Backbone.Collection.extend({
  model: MovementCentral.Models.Like,
  url: 'api/likes'
});

MovementCentral.Collections.comment_likes = new MovementCentral.Collections.Likes();
MovementCentral.Collections.post_likes = new MovementCentral.Collections.Likes();
