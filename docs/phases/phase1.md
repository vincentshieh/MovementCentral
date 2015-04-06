# Phase 1: User Authentication, Creating and Viewing Posts and Comments

## Rails
### Models
* User
* Post
* Comment

### Controllers
* UsersController (create, new)
* SessionsController (create, new, destroy)
* Api::PostsController (create, new, index, show)
* Api::CommentsController (create, new, show)

### Views
* users/new.html.erb
* session/new.html.erb
* api/posts/show.json.jbuilder

## Backbone
### Models
* User
* Post (parses nested `comments` association)
* Comment

### Collections
* Users
* Posts
* Comments

### Views
* ProfileShow (composite view, contains PostForm subview and PostsIndex subview)
* PostForm
* PostsIndex (composite view, contains PostsIndexItem subviews)
* PostsIndexItem (composite view, contains PostShow subview, CommentsIndex subview, and CommentForm subview)
* PostShow
* CommentsIndex (composite view, contains CommentsIndexItem subviews)
* CommentsIndexItem
* CommentForm

## Gems/Libraries
