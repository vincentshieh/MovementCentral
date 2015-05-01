# Movement Central

Movement Central is a social network for dancers built using Ruby on Rails, PostgreSQL, Backbone.js, jQuery, Twitter Bootstrap, and Filepicker. It is modeled on Facebook's feel and functionality.

Visit live at: [http://www.movementcentral.co][url]

[url]: http://www.movementcentral.co

## Features
A user can:

* Create an account by providing an unique email and some basic information
* Log in from multiple browsers simultaneously
* Upload and update his/her profile picture and cover photo
* Edit detailed user information in the about subview of his/her profile
* Request, accept, and decline friendships
* View friends' full profile pages
  * Timeline subview shows a friend's user information and received posts
  * About subview shows a friend's detailed user information
  * Friends subview shows a list of a friend's friends
* Post status updates and on friends' timelines
* Upload photos in posts
* Comment on posts
* Like posts and comments
* Browse through a feed of friends' posts
* Search for dancers by name, dance style, or dance company

## Code Highlights
* Search feature sends query to Rails as attribute of params hash and updates results as the user types.
```javascript
this.$('.search-query').on('input focus', function() {
  view.collection.fetch({
    url: 'api/users/search',
    data: {
      query: view.$('.search-query').val()
    }
  });
});
```

## Design Docs

See implementation roadmap here: [Design Docs][design-docs]

[design-docs]: ./docs/design.md
