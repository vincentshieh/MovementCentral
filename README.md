# Movement Central

[Movement Central][url]

[url]: http://www.movementcentral.co

## Minimum Viable Product
Movement Central is a clone of Facebook built on Rails and Backbone. Users can:

<!-- This is a Markdown checklist. Use it to keep track of your progress! -->

- [x] Create accounts
- [x] Create sessions (log in)
- [x] Create posts
- [x] Create post comments
- [x] View posts and comments
- [x] Upload photos in posts
- [x] Add friends
- [x] View a feed of friends' posts
- [x] Like posts and comments
- [ ] Search for users by name and dance style

## Design Docs
* [View Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication, Post and Comment Creation and Views (~2 days)
I will implement user authentication in Rails based on the practices learned at
App Academy. I will add API routes to render post and comment data as JSON, and
then add Backbone models and collections that fetch data from those routes. By
the end of this phase, users will be able to create posts and post comments,
as well as view them in the profile show page. The app will be pushed to Heroku
by the end of the first day.

[Details][phase-one]

### Phase 2: Uploading Photos and Adding Friends (~1 day)
I will integrate Filepicker for file upload so users can add photos to posts
using the `PostForm`. By the end of this phase, a user will be able to Friend
or Unfriend another user by clicking a button in the other user's profile show
page.

[Details][phase-two]

### Phase 3: News Feed (~1 day)
I will add a `feed` route that uses the `current_user`'s `friends`
association to render a list of posts ordered chronologically. On the Backbone
side, I will make a `FeedShow` view whose `posts` collection fetches from the
new route. Ultimately, this will be the page users see after logging in.

[Details][phase-three]

### Phase 4: Likes (~0.5 days)
I will use a polymorphic association to allow users to Like and Unlike both
posts and comments.

[Details][phase-four]

### Phase 5: Searching for Users (~1 day)
I will add a `search` route to the Users controller. On the
Backbone side, there will be a `SearchResults` composite view that has
`SearchItem` subviews. This view will use a `users` collection, but it will
fetch from the new `search` route.

[Details][phase-five]

### Bonus Features (TBD)
- [ ] Navbar (has log in form when logged out and user options when logged in)
- [ ] `ProfileNav` view (includes cover photo, profile picture, and links)
- [ ] `AboutShow` view (displays detailed user information)
- [ ] `FriendsShow` view (displays user's friends)
- [ ] `PhotosShow` view (displays user's photos)
- [ ] Previews for About, Friends, and Photos pages in `ProfileShow` view

[phase-one]: ./docs/phases/phase1.md
[phase-two]: ./docs/phases/phase2.md
[phase-three]: ./docs/phases/phase3.md
[phase-four]: ./docs/phases/phase4.md
[phase-five]: ./docs/phases/phase5.md
