MovementCentral.Collections.Friendships = Backbone.Collection.extend({
  comparator: 'created_at',
  model: MovementCentral.Models.Friendship,
  url: 'api/friendships'
});

MovementCentral.Collections.friendships = new MovementCentral.Collections.Friendships();
MovementCentral.Collections.search_results = new MovementCentral.Collections.Friendships();
