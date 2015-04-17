User.destroy_all()
Post.destroy_all()
Comment.destroy_all()
Friendship.destroy_all()
Like.destroy_all()

User.create!(email: 'mistyc@abt.org', password: 'mistymisty',
             fname: 'Misty', lname: 'Copeland', dance_style: 'Ballet',
             gender: 'Female', company: 'American Ballet Theatre',
             profile_picture: 'http://www.joelminden.com/wp-content/uploads/2013/08/Misty-Copeland-5C.jpg',
             cover_photo: 'https://s-media-cache-ak0.pinimg.com/736x/c2/4e/dd/c24eddada7b47ce854946ed508858c1b.jpg',
             job_title: 'Principal dancer', school: 'San Francisco Ballet School',
             current_city: 'New York City, New York', hometown: 'Los Angeles, California',
             bio: "Misty Copeland (born September 10, 1982) is an author, entertainer, and American ballet dancer for American Ballet Theatre (ABT), one of the three leading classical ballet companies in the United States (along with New York City Ballet and San Francisco Ballet). She is the third African-American soloist and first in two decades with ABT, where she has endured the cultural pressure associated with this role.
                   Copeland is considered a prodigy who rose to stardom despite not starting ballet until the age of 13. By age 15, Copeland's mother and ballet teachers, who were serving as her custodial guardians, fought a custody battle over her. Meanwhile, Copeland, who was already an award-winning dancer, was fielding professional offers. The 1998 legal proceedings involved filings for emancipation by Copeland and restraining orders by her mother. Both sides dropped legal proceedings, and Copeland moved home to begin studying under a new teacher who was a former ABT member.
                   In 1997, Copeland won the Los Angeles Music Center Spotlight Award as the best dancer in Southern California. After two summer workshops with the ABT, she became a member of the Studio Company in 2000, a member of the corps de ballet in 2001, and a soloist in 2007. Stylistically, she is considered a classical ballet dancer. As a soloist since the autumn of 2007, she has been described as having matured into a more contemporary and sophisticated dancer.")
User.create!(email: 'sergeip@opera-novosibirsk.ru', password: 'sergei',
             fname: 'Sergei', lname: 'Polunin', dance_style: 'Ballet',
             gender: 'Male', company: 'Novosibirsk Opera and Ballet Theatre',
             profile_picture: 'http://ftape.com/media/wp-content/uploads/2014/10/Sergei-Polunin_Numero-Homme_04.jpg',
             cover_photo: 'http://www.ukrainehousing.com/UserFiles/picKievSights5(1).jpg',
             job_title: 'Principal dancer', school: 'British Royal Ballet School',
             current_city: 'Novosibirsk, Russia', hometown: 'Kherson, Ukraine',
             bio: 'Sergei Vladimirovich Polunin is a Ukrainian ballet dancer who was formerly a principal dancer with the British Royal Ballet and is currently a principal dancer with Stanislavsky and Nemirovich-Danchenko Moscow Academic Music Theatre and the Novosibirsk Opera and Ballet Theatre.')
User.create!(email: 'ric@rydance.com', password: 'riccardo',
             fname: 'Riccardo', lname: 'Cocchi', dance_style: 'Ballroom',
             gender: 'Male', company: 'Riccardo and Yulia',
             profile_picture: 'https://s-media-cache-ak0.pinimg.com/736x/0f/cc/9a/0fcc9a7f93604dedbc0a3fc80616f987.jpg',
             cover_photo: 'https://fbcdn-sphotos-d-a.akamaihd.net/hphotos-ak-xpa1/v/t1.0-9/941645_10151604935169526_1399257331_n.jpg?oh=987a5c919fa45ffcecba8aa854b77f75&oe=55A3CA80&__gda__=1436219483_9386297d69ee75021bbdef41b56a838d',
             job_title: 'Ballroom dancer and teacher', school: 'various studios',
             current_city: 'Los Angeles, California', hometown: 'Belgorod City, Russia',
             bio: 'The son of famed Italian ballroom coaches, Riccardo always knew that dance was his future and one day he would become the world champion. Riccardo was born in Terni, Italy. Currently, he resides in and represents the United States of America. Prior to partnering with Yulia, Riccardo and his previous partner were undefeated Italian Amateur Latin Champions and the World Amateur Latin Champions.')
User.create!(email: 'yulia@rydance.com', password: 'yuliayulia',
             fname: 'Yulia', lname: 'Zagoruychenko', dance_style: 'Ballroom',
             gender: 'Female', company: 'Riccardo and Yulia',
             profile_picture: 'https://s-media-cache-ak0.pinimg.com/236x/7e/4c/d8/7e4cd82a37730a16bb961aa4675125f8.jpg',
             cover_photo: 'http://www.enmotionphoto.com/img/s1/v54/p1156821972-3.jpg',
             job_title: 'Ballroom dancer and teacher', school: 'various studios',
             current_city: 'Los Angeles, California', hometown: 'Belgorod City, Russia',
             bio: 'Yulia was born in Belgorod City, Russia and first started dancing at the age of four. She then began ballroom dancing at age seven, and began teaching at the early age of 11.  A rising star in Russia, Yulia captured her first major title at the age of 12, becoming Russian Junior National Champion. Yulia’s wunderkind status only grew as she went on to dominate youth division. After moving to the United States, to dance with her former partner, Yulia won many titles including the World South American Showdance Championship and the US National Professional Latin Championship. Yulia also placed as a grand finalist in all major World Professional Latin competitions. On July 4, 2011, Carnegie Corporation honored Yulia and 44 other exceptional US immigrants as “Americans by Choice”.')
User.create!(email: 'ricky@sytycd11.com', password: 'rickyricky',
             fname: 'Ricky', lname: 'Ubeda', dance_style: 'Contemporary',
             gender: 'Male', company: 'So You Think You Can Dance',
             profile_picture: 'http://cdn.thedailybeast.com/content/dailybeast/articles/2014/09/04/so-you-think-you-can-dance-winner-ricky-ubeda-is-adorable-and-tired/jcr:content/image.img.2000.jpg/1409867456714.cached.jpg',
             cover_photo: 'http://static2.hypable.com/wp-content/uploads/2014/07/SYTYCD-season-11-200th-episode-recap-666x341.jpg')
User.create!(email: 'travis@sytycd.com', password: 'travis',
             fname: 'Travis', lname: 'Wall', dance_style: 'Contemporary',
             gender: 'Male', company: 'So You Think You Can Dance',
             profile_picture: 'http://h.fastcompany.net/multisite_files/fastcompany/imagecache/1280/poster/2014/08/3034678-poster-p-1-all-the-right-moves-how-dancer-travis-wall-stepped-up-to-choreographer.jpg',
             cover_photo: 'http://www.etonline.com/media/photo/2013/08/24036735/640_travis_wall_3_130830.jpg')
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
