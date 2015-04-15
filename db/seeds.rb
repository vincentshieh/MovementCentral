User.destroy_all()
Post.destroy_all()
Comment.destroy_all()
Friendship.destroy_all()
Like.destroy_all()

User.create!(email: 'mistyc@abt.org', password: 'mistymisty',
             fname: 'Misty', lname: 'Copeland', dance_style: 'Ballet',
             gender: 'Female', company: 'American Ballet Theatre',
             profile_picture: 'http://www.joelminden.com/wp-content/uploads/2013/08/Misty-Copeland-5C.jpg',
             cover_photo: 'https://s-media-cache-ak0.pinimg.com/736x/c2/4e/dd/c24eddada7b47ce854946ed508858c1b.jpg')
User.create!(email: 'sergeip@opera-novosibirsk.ru', password: 'sergei',
             fname: 'Sergei', lname: 'Polunin', dance_style: 'Ballet',
             gender: 'Male', company: 'Novosibirsk Opera and Ballet Theatre',
             profile_picture: 'http://ftape.com/media/wp-content/uploads/2014/10/Sergei-Polunin_Numero-Homme_04.jpg')
User.create!(email: 'ric@rydance.com', password: 'riccardo',
             fname: 'Riccardo', lname: 'Cocchi', dance_style: 'Ballroom',
             gender: 'Male', company: 'Riccardo and Yulia',
             profile_picture: 'https://s-media-cache-ak0.pinimg.com/736x/0f/cc/9a/0fcc9a7f93604dedbc0a3fc80616f987.jpg')
User.create!(email: 'yulia@rydance.com', password: 'yuliayulia',
             fname: 'Yulia', lname: 'Zagoruychenko', dance_style: 'Ballroom',
             gender: 'Female', company: 'Riccardo and Yulia',
             profile_picture: 'https://s-media-cache-ak0.pinimg.com/236x/7e/4c/d8/7e4cd82a37730a16bb961aa4675125f8.jpg')
User.create!(email: 'ricky@sytycd11.com', password: 'rickyricky',
             fname: 'Ricky', lname: 'Ubeda', dance_style: 'Contemporary',
             gender: 'Male', company: 'So You Think You Can Dance',
             profile_picture: 'http://cdn.thedailybeast.com/content/dailybeast/articles/2014/09/04/so-you-think-you-can-dance-winner-ricky-ubeda-is-adorable-and-tired/jcr:content/image.img.2000.jpg/1409867456714.cached.jpg')
User.create!(email: 'travis@sytycd.com', password: 'travis',
             fname: 'Travis', lname: 'Wall', dance_style: 'Contemporary',
             gender: 'Male', company: 'So You Think You Can Dance',
             profile_picture: 'http://h.fastcompany.net/multisite_files/fastcompany/imagecache/1280/poster/2014/08/3034678-poster-p-1-all-the-right-moves-how-dancer-travis-wall-stepped-up-to-choreographer.jpg')
User.create!(email: 'ianeastwood@mwc.com', password: 'ianian',
             fname: 'Ian', lname: 'Eastwood', dance_style: 'Hip-hop',
             gender: 'Male', company: 'Mos Wanted Crew',
             profile_picture: 'https://pbs.twimg.com/profile_images/551779700603768832/P_Ha91D7.jpeg')
User.create!(email: 'kyle@mm.com', password: 'kylekyle',
             fname: 'Kyle', lname: 'Hanagami', dance_style: 'Hip-hop',
             gender: 'Male', company: 'Making Moves',
             profile_picture: 'http://www.drdancestudio.com/sites/default/files/instructor/photo/KyleHanagami-1.jpg')
User.create!(email: 'sonya@stdance.com', password: 'sonyasonya',
             fname: 'Sonya', lname: 'Tayeh', dance_style: 'Jazz',
             gender: 'Female', company: 'Sonya Tayeh Dance',
             profile_picture: 'http://newimages.bwwstatic.com/upload10/569758/Sonya3.jpeg')
User.create!(email: 'hopeb@aa.com', password: 'hopehope',
             fname: 'Hope', lname: 'Boykin', dance_style: 'Modern',
             gender: 'Female', company: 'Alvin Ailey American Dance Theater',
             profile_picture: 'http://m7.i.pbase.com/g9/26/574826/2/154649737.zuujnugs.jpg')
User.create!(email: 'jerb@aa.com', password: 'jeroboam',
             fname: 'Jeroboam', lname: 'Bozeman', dance_style: 'Modern',
             gender: 'Male', company: 'Alvin Ailey American Dance Theater',
             profile_picture: 'http://res.cloudinary.com/sagacity/image/upload/c_crop,h_736,w_640,x_0,y_34/c_fit,w_640/Jeroboam_Bozeman_Photo_Eduardo_Patino_izpuof.jpg')

Friendship.create!(requester_id: 1, requestee_id: 2, accepted: true)
Friendship.create!(requester_id: 1, requestee_id: 3, accepted: true)
Friendship.create!(requester_id: 1, requestee_id: 4, accepted: true)
Friendship.create!(requester_id: 5, requestee_id: 1, accepted: false)
Friendship.create!(requester_id: 6, requestee_id: 1, accepted: true)
Friendship.create!(requester_id: 7, requestee_id: 1, accepted: true)
Friendship.create!(requester_id: 8, requestee_id: 1, accepted: true)
Friendship.create!(requester_id: 1, requestee_id: 9, accepted: true)
Friendship.create!(requester_id: 1, requestee_id: 10, accepted: true)
Friendship.create!(requester_id: 11, requestee_id: 1, accepted: false)
Friendship.create!(requester_id: 2, requestee_id: 3, accepted: true)
Friendship.create!(requester_id: 2, requestee_id: 4, accepted: true)
Friendship.create!(requester_id: 3, requestee_id: 4, accepted: true)
Friendship.create!(requester_id: 3, requestee_id: 7, accepted: false)
Friendship.create!(requester_id: 3, requestee_id: 9, accepted: true)
Friendship.create!(requester_id: 4, requestee_id: 6, accepted: true)
Friendship.create!(requester_id: 5, requestee_id: 8, accepted: false)
Friendship.create!(requester_id: 5, requestee_id: 9, accepted: true)
Friendship.create!(requester_id: 5, requestee_id: 11, accepted: false)
Friendship.create!(requester_id: 9, requestee_id: 6, accepted: true)
Friendship.create!(requester_id: 6, requestee_id: 7, accepted: true)
Friendship.create!(requester_id: 7, requestee_id: 8, accepted: true)
Friendship.create!(requester_id: 7, requestee_id: 9, accepted: true)
Friendship.create!(requester_id: 8, requestee_id: 9, accepted: false)
Friendship.create!(requester_id: 9, requestee_id: 10, accepted: true)
Friendship.create!(requester_id: 9, requestee_id: 11, accepted: true)
Friendship.create!(requester_id: 10, requestee_id: 11, accepted: true)

Post.create!(author_id: 1, recipient_id: 1,
             content: 'Always a blast performing at Queensland Performing Arts Center. Thanks for the support, Australia!',
             picture: 'http://www.trbimg.com/img-542b28a0/turbine/ct-misty-copeland-american-ballet-theatre')
Post.create!(author_id: 2, recipient_id: 1,
             content: 'my calves are so sore from taking your class yesterday')
Post.create!(author_id: 6, recipient_id: 1,
             content: 'Great having you as a guest judge last week. Good luck on tour!')
Post.create!(author_id: 4, recipient_id: 1,
             content: 'You were amazing in NYC :)')
Post.create!(author_id: 1, recipient_id: 1,
             content: 'Check out Under Armour!',
             picture: 'https://s-media-cache-ak0.pinimg.com/736x/c2/4e/dd/c24eddada7b47ce854946ed508858c1b.jpg')
Post.create!(author_id: 3, recipient_id: 4,
             content: 'Victorious at Blackpool 2014!',
             picture: 'http://www.dance-mag.com/wp-content/uploads/2010/06/bp10-pro-lat-037.jpg')
Post.create!(author_id: 7, recipient_id: 7,
             content: '#fam #whatdoyouwantmos?',
             picture: 'http://www.mtv.com/onair/dance_crew/season_7/photos/cast/mos_wanted_crew/flipbook/group.jpg')
Post.create!(author_id: 10, recipient_id: 11,
             content: 'carpool to rehearsal tmrw?')

Comment.create!(author_id: 1, post_id: 2,
                content: 'just means you gotta train harder ;)')
Comment.create!(author_id: 1, post_id: 3,
                content: 'It was my pleasure!')
Comment.create!(author_id: 7, post_id: 6,
                content: 'Nicely done')
Comment.create!(author_id: 2, post_id: 6,
                content: 'No surprise there')
Comment.create!(author_id: 1, post_id: 6,
                content: 'Congrats guys!')
Comment.create!(author_id: 11, post_id: 8,
                content: 'alright, just remember to set your alarm this time')

Like.create!(user_id: 1, likable_type: 'Post', likable_id: 6)
Like.create!(user_id: 2, likable_type: 'Post', likable_id: 6)
Like.create!(user_id: 6, likable_type: 'Post', likable_id: 6)
Like.create!(user_id: 7, likable_type: 'Post', likable_id: 6)
Like.create!(user_id: 9, likable_type: 'Post', likable_id: 6)
Like.create!(user_id: 1, likable_type: 'Post', likable_id: 7)
Like.create!(user_id: 6, likable_type: 'Post', likable_id: 7)
Like.create!(user_id: 8, likable_type: 'Post', likable_id: 7)
Like.create!(user_id: 9, likable_type: 'Post', likable_id: 7)
Like.create!(user_id: 2, likable_type: 'Post', likable_id: 1)
Like.create!(user_id: 3, likable_type: 'Post', likable_id: 1)
Like.create!(user_id: 4, likable_type: 'Post', likable_id: 1)
Like.create!(user_id: 6, likable_type: 'Post', likable_id: 1)
Like.create!(user_id: 7, likable_type: 'Post', likable_id: 1)
Like.create!(user_id: 8, likable_type: 'Post', likable_id: 1)
Like.create!(user_id: 9, likable_type: 'Post', likable_id: 1)
Like.create!(user_id: 10, likable_type: 'Post', likable_id: 1)
Like.create!(user_id: 3, likable_type: 'Comment', likable_id: 1)
Like.create!(user_id: 4, likable_type: 'Comment', likable_id: 1)
