MovementCentral.Collections.Posts = Backbone.Collection.extend({
  model: MovementCentral.Models.Post,
  url: 'api/posts',

  comparator: 'created_at',

  getOrFetch: function (id) {
    var post = this.get(id),
      posts = this;

    if(!post) {
      post = new MovementCentral.Models.Post({ id: id });
      post.fetch({
        success: function () {
          posts.add(post);
        }
      });
    } else {
      post.fetch();
    }

    return post;
  }
});

MovementCentral.Collections.posts = new MovementCentral.Collections.Posts();
