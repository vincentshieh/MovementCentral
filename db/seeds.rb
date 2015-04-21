User.destroy_all()
Post.destroy_all()
Comment.destroy_all()
Friendship.destroy_all()
Like.destroy_all()

User.create!(email: 'mistyc@abt.org', password: 'mistymisty',
             fname: 'Misty', lname: 'Copeland', dance_style: 'Ballet',
             gender: 'Female', company: 'American Ballet Theatre',
             profile_picture: 'https://www.filepicker.io/api/file/qKgBiO89T0CFEArzOFol',
             cover_photo: 'https://www.filepicker.io/api/file/fqGDB2EcR6iT6viwwEuW',
             job_title: 'Principal dancer', school: 'San Francisco Ballet School',
             current_city: 'New York City, New York', hometown: 'Los Angeles, California',
             bio: "Misty Copeland (born September 10, 1982) is an author, entertainer, and American ballet dancer for American Ballet Theatre (ABT), one of the three leading classical ballet companies in the United States (along with New York City Ballet and San Francisco Ballet). She is the third African-American soloist and first in two decades with ABT, where she has endured the cultural pressure associated with this role.
                   Copeland is considered a prodigy who rose to stardom despite not starting ballet until the age of 13. By age 15, Copeland's mother and ballet teachers, who were serving as her custodial guardians, fought a custody battle over her. Meanwhile, Copeland, who was already an award-winning dancer, was fielding professional offers. The 1998 legal proceedings involved filings for emancipation by Copeland and restraining orders by her mother. Both sides dropped legal proceedings, and Copeland moved home to begin studying under a new teacher who was a former ABT member.
                   In 1997, Copeland won the Los Angeles Music Center Spotlight Award as the best dancer in Southern California. After two summer workshops with the ABT, she became a member of the Studio Company in 2000, a member of the corps de ballet in 2001, and a soloist in 2007. Stylistically, she is considered a classical ballet dancer. As a soloist since the autumn of 2007, she has been described as having matured into a more contemporary and sophisticated dancer.")
User.create!(email: 'sergeip@opera-novosibirsk.ru', password: 'sergei',
             fname: 'Sergei', lname: 'Polunin', dance_style: 'Ballet',
             gender: 'Male', company: 'Novosibirsk Opera and Ballet Theatre',
             profile_picture: 'https://www.filepicker.io/api/file/8EHP8E1DSiC6uesK4M4U',
             cover_photo: 'https://www.filepicker.io/api/file/9fhcuAN6QmmR6x7TRIN5',
             job_title: 'Principal dancer', school: 'British Royal Ballet School',
             current_city: 'Novosibirsk, Russia', hometown: 'Kherson, Ukraine',
             bio: 'Sergei Vladimirovich Polunin is a Ukrainian ballet dancer who was formerly a principal dancer with the British Royal Ballet and is currently a principal dancer with Stanislavsky and Nemirovich-Danchenko Moscow Academic Music Theatre and the Novosibirsk Opera and Ballet Theatre.')
User.create!(email: 'ric@rydance.com', password: 'riccardo',
             fname: 'Riccardo', lname: 'Cocchi', dance_style: 'Ballroom',
             gender: 'Male', company: 'Riccardo and Yulia Dance',
             profile_picture: 'https://www.filepicker.io/api/file/sflLgcc4ThOTkCGXPFPx',
             cover_photo: 'https://www.filepicker.io/api/file/BBBsnV4pS5OuwSkqPwto',
             job_title: 'Ballroom dancer and teacher', school: 'various studios',
             current_city: 'Los Angeles, California', hometown: 'Belgorod City, Russia',
             bio: 'The son of famed Italian ballroom coaches, Riccardo always knew that dance was his future and one day he would become the world champion. Riccardo was born in Terni, Italy. Currently, he resides in and represents the United States of America. Prior to partnering with Yulia, Riccardo and his previous partner were undefeated Italian Amateur Latin Champions and the World Amateur Latin Champions.')
User.create!(email: 'yulia@rydance.com', password: 'yuliayulia',
             fname: 'Yulia', lname: 'Zagoruychenko', dance_style: 'Ballroom',
             gender: 'Female', company: 'Riccardo and Yulia Dance',
             profile_picture: 'https://www.filepicker.io/api/file/iiasYiTyR8moPSmHUWZY',
             cover_photo: 'https://www.filepicker.io/api/file/pewc92WkS3W2u5jnx3g7',
             job_title: 'Ballroom dancer and teacher', school: 'various studios',
             current_city: 'Los Angeles, California', hometown: 'Belgorod City, Russia',
             bio: 'Yulia was born in Belgorod City, Russia and first started dancing at the age of four. She then began ballroom dancing at age seven, and began teaching at the early age of 11.  A rising star in Russia, Yulia captured her first major title at the age of 12, becoming Russian Junior National Champion. Yulia’s wunderkind status only grew as she went on to dominate youth division. After moving to the United States, to dance with her former partner, Yulia won many titles including the World South American Showdance Championship and the US National Professional Latin Championship. Yulia also placed as a grand finalist in all major World Professional Latin competitions. On July 4, 2011, Carnegie Corporation honored Yulia and 44 other exceptional US immigrants as “Americans by Choice”.')
User.create!(email: 'ricky@sytycd11.com', password: 'rickyricky',
             fname: 'Ricky', lname: 'Ubeda', dance_style: 'Contemporary',
             gender: 'Male', company: 'So You Think You Can Dance',
             profile_picture: 'https://www.filepicker.io/api/file/YJtuyT0eS8G4CoEefx6I',
             cover_photo: 'https://www.filepicker.io/api/file/gEiQQGTpKHKRjG0OvvOA',
             job_title: 'Contemporary dancer', school: 'Stars Dance Company',
             current_city: 'Los Angeles, California', hometown: 'Miami, Florida',
             bio: 'Ricky Ubeda is the winner on season 11 of So You Think You Can Dance.')
User.create!(email: 'travis@sytycd.com', password: 'travis',
             fname: 'Travis', lname: 'Wall', dance_style: 'Contemporary',
             gender: 'Male', company: 'So You Think You Can Dance',
             profile_picture: 'https://www.filepicker.io/api/file/L0NkRUuuQ6iuN7vt3tvg',
             cover_photo: 'https://www.filepicker.io/api/file/VdKtOPlRwSONFH3hGr7N',
             job_title: 'Choreographer', school: "Denise Wall's Dance Energy",
             current_city: 'Los Angeles, California', hometown: 'Virginia Beach, Virginia',
             bio: "Travis Michael Wall (born September 16, 1987) is an American dancer and dance instructor, specializing in contemporary dance and jazz dance. He is best known for his 2006 appearance as a competitor on the second season of the television show So You Think You Can Dance, which airs on the Fox Network. As of 2012, he is currently a choreographer for the show. In 2011, he was nominated for an Emmy for his work on the show's seventh season. In 2012, he starred in the reality show All The Right Moves on Oxygen, where he, Teddy Forance, Nick Lazzarini and Kyle Robinson attempt to launch their own dance company called Shaping Sound.")
User.create!(email: 'ianeastwood@mwc.com', password: 'ianian',
             fname: 'Ian', lname: 'Eastwood', dance_style: 'Hip-hop',
             gender: 'Male', company: 'Mos Wanted Crew',
             profile_picture: 'https://www.filepicker.io/api/file/6YgI5BPpT7auDiqUL95y',
             cover_photo: 'https://www.filepicker.io/api/file/Jj6WD09VSJunFQd1zq4W',
             job_title: 'Choreographer and dancer', school: 'various studios',
             current_city: 'Los Angeles, California', hometown: 'Chicago, Illinois',
             bio: 'Member of the well known dance group Mos Wanted Crew who has also worked with Young Lions, Millennium Dance Center, Coastal Dance Rage, and Movement Lifestyle. He appeared on Dance Showdown and Return of the Superstars.')
User.create!(email: 'kyle@mm.com', password: 'kylekyle',
             fname: 'Kyle', lname: 'Hanagami', dance_style: 'Hip-hop',
             gender: 'Male', company: 'Making Moves',
             profile_picture: 'https://www.filepicker.io/api/file/3OkJ6UgPRcqOjOtZb399',
             cover_photo: 'https://www.filepicker.io/api/file/Rn06D3K3RySGzHgmiZ2V',
             job_title: 'Choreographer and dancer', school: 'Debbie Reynolds Dance Studios',
             current_city: 'Los Angeles, California', hometown: 'Los Angeles, California',
             bio: 'Kyle Hanagami is one of the most rapidly growing names in the Los Angeles dance industry. His creativity and unique take on choreography has earned him a spot as an in-demand choreographer across the United States and around the world.
                   Currently, Kyle is on faculty at three of the top studios in Los Angeles; Debbie Reynolds Dance Studio, Movement Lifestyle, and Edge Performing Arts Center. Dance Spirit Magazine named him "Hollywood\'s hottest up-and-coming choreographer."
                   Kyle has been recognized for his achievements by The Industry Voice Awards in the categories of Classof the Year at Debbie Reynolds and Edge, as well as for Performance of the Year at Carnival Choreographers Ball. His credits include choreographing for X Factor, Nickelodeon, Fanta, as well as dancing for artists such as Justin Bieber, Black Eyed Peas, and many more.')
User.create!(email: 'sonya@stdance.com', password: 'sonyasonya',
             fname: 'Sonya', lname: 'Tayeh', dance_style: 'Jazz',
             gender: 'Female', company: 'Sonya Tayeh Dance',
             profile_picture: 'https://www.filepicker.io/api/file/fY3ehWV5SBehijOw5DWv',
             cover_photo: 'https://www.filepicker.io/api/file/DWPSO8AeQn22aXij1f9p',
             job_title: 'Choreographer', school: 'Full Circle Dance Company',
             current_city: 'Los Angeles, California', hometown: 'Detroit, Michigan',
             bio: 'Sonya Tayeh is a dance teacher and jazz and contemporary choreographer from Detroit, Michigan best known for being a choreographer on the television series So You Think You Can Dance. In 2013, she was nominated for an Emmy Award for her work on season nine.
                   Tayeh was a house dancer during her teenage years and she did not start any formal dance training until she was 18 and a student at Wayne State University. After graduating in 2002, she moved to California and ran a dance company in San Francisco where she developed her own style of choreography which she calls combat jazz. In 2007, she was discovered by a talent agent from McDonald Selznick Associates who saw a performance she choreographed for The Carnival: Choreographer’s Ball. Three months after being signed, she booked a job on So You Think You Can Dance.
                   Since gaining mainstream exposure, Tayeh has choreographed for Madonna, Florence and the Machine, Kylie Minogue, the Los Angeles Ballet, and the San Jose Reparatory Theater. Aside from theater and tours, she stays active teaching jazz and contemporary classes at dance conventions.')
User.create!(email: 'hopeb@aa.com', password: 'hopehope',
             fname: 'Hope', lname: 'Boykin', dance_style: 'Modern',
             gender: 'Female', company: 'Alvin Ailey American Dance Theater',
             profile_picture: 'https://www.filepicker.io/api/file/ygT3hIpTQPWL9Yqqw0s5',
             cover_photo: 'https://www.filepicker.io/api/file/aNFfIE4ZSNWlTkSaeuSX',
             job_title: 'Dancer', school: 'The Ailey School',
             current_city: 'New York, New York', hometown: 'Durham, North Carolina',
             bio: 'Hope Boykin (Durham, NC) is a three-time recipient of the American Dance Festival’s Young Tuition Scholarship.  She attended Howard University and while in Washington, DC she performed with Lloyd Whitmore’s New World Dance Company. Ms. Boykin was a student and intern at The Ailey School. She was assistant to the late Talley Beatty and an original member of Complexions. Ms. Boykin was a member of Philadanco and received a New York Dance and Performance Award (“Bessie”). In 2005, Ms. Boykin choreographed Acceptance In Surrender in collaboration with Abdur-Rahim Jackson and Matthew Rushing for Alvin Ailey American Dance Theater. Most recently she choreographed Go In Grace with award-winning singing group \'Sweet Honey In The Rock\' for the Company\'s 50th anniversary season. Ms. Boykin joined the Company in 2000.')
User.create!(email: 'jerb@aa.com', password: 'jeroboam',
             fname: 'Jeroboam', lname: 'Bozeman', dance_style: 'Modern',
             gender: 'Male', company: 'Alvin Ailey American Dance Theater',
             profile_picture: 'https://www.filepicker.io/api/file/FIyQhUA8TNazttStCmdA',
             cover_photo: 'https://www.filepicker.io/api/file/vyqQXZ0LTpuBo3aSwHXN',
             job_title: 'Dancer', school: 'Joffrey Ballet School',
             current_city: 'New York, New York', hometown: 'Brooklyn, New York',
             bio: 'Jeroboam Bozeman (Brooklyn, NY) began his dance training under Ruth Sistaire at the Ronald Edmonds Learning Center. He later joined Creative Outlet, under Jamel Gaines, and was granted full scholarships at the Joffrey Ballet School and Dance Theatre of Harlem School. Mr. Bozeman is a gold medal recipient from the NAACP ACT-SO Competition in Dance. He performed in Elton John and Tim Rice’s Broadway musical Aida (International tour in China) and was a part of Philadanco, Donald Byrd\'s Spectrum Dance Theater, and Ailey II. This is Mr. Bozeman’s first year with the Company.')
User.create!(email: 'twitch@stepup.2thestreets', password: 'stephen',
             fname: 'Stephen', lname: 'Boss', dance_style: 'Hip-hop',
             gender: 'Male', company: 'Step Up Cast', nickname: 'tWitch',
             profile_picture: 'https://www.filepicker.io/api/file/wvqNxClRTxkRzVSKsNun',
             cover_photo: 'https://www.filepicker.io/api/file/28IHa8CxQmieZ0vJbJ6n',
             job_title: 'Krumper', school: 'The Streets',
             current_city: 'Los Angeles, California', hometown: 'Atlanta, Georgia',
             bio: 'As a child, tWitch was always seen moving and dancing hip-hop, which is how he earned his nickname. He graduated from Lee High School in Montgomery, Alabama in 2000 and continued to study dance at Southern Union State Community College in Wadley, Alabama. tWitch first appeared on television when he placed second on Star Search behind America\'s Best Dance Crew group Super Crew. Then in 2003, Boss went to Los Angeles and auditioned to become a contestant on MTV\'s The Wade Robson Project where he eventually placed third in the competition. At the same time, he attended Chapman University in Southern California where he studied dance. tWitch continues to teach dance classes and workshops around the world and has even created an online video sketch-comedy in December of 2009 called TheKommune.com. He landed the movie roles of Jason in Step Up 3D and Taz, in Stomp the Yard 2: Homecoming. tWitch is part of dance groups Breed OCLA and Chill Factor Crew and is participating in the non-profit, Dizzy Feet Foundation, which supports underprivileged youth in dance education and opportunities.')
User.create!(email: 'bluprint@dragonhouse.io', password: 'dorian',
             fname: 'Dorian', lname: 'Hector', dance_style: 'Hip-hop',
             gender: 'Male', company: 'Dragon House', nickname: 'Bluprint',
             profile_picture: 'https://www.filepicker.io/api/file/KV47rEcRVyB0TgzNbX88',
             cover_photo: 'https://www.filepicker.io/api/file/FYxpswNUQPWZqd1VC0O9',
             job_title: 'Animator', school: 'Dragon House',
             current_city: 'Los Angeles, California', hometown: 'Atlanta, Georgia',
             bio: 'Dragon House!')
User.create!(email: 'megan@batoon.com', password: 'meganmegan',
             fname: 'Megan', lname: 'Batoon', dance_style: 'Hip-hop',
             gender: 'Female', company: 'World of Dance',
             profile_picture: 'https://www.filepicker.io/api/file/6Lr0NPLqRPilBx7uGLi1',
             cover_photo: 'https://www.filepicker.io/api/file/EsE6mKRTSpeqaSSsfBj5',
             job_title: 'Dancer', school: 'Millennium Dance Complex',
             current_city: 'Los Angeles, California', hometown: 'Jacksonville, Florida',
             bio: 'Dancer, cheoreographer, and social media phenomenon across multiple platforms, including Instagram, Vine, and most notably, YouTube. She creates video blogs, comedy sketches, and choreography videos for her hundreds of thousands of subscribers on her self-titled YouTube channel.')

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
Friendship.create!(requester_id: 14, requestee_id: 1, accepted: true)
Friendship.create!(requester_id: 12, requestee_id: 1, accepted: false)
Friendship.create!(requester_id: 12, requestee_id: 13, accepted: true)
Friendship.create!(requester_id: 12, requestee_id: 8, accepted: true)
Friendship.create!(requester_id: 12, requestee_id: 7, accepted: true)
Friendship.create!(requester_id: 12, requestee_id: 6, accepted: true)
Friendship.create!(requester_id: 12, requestee_id: 5, accepted: true)
Friendship.create!(requester_id: 14, requestee_id: 13, accepted: true)
Friendship.create!(requester_id: 14, requestee_id: 12, accepted: true)
Friendship.create!(requester_id: 14, requestee_id: 8, accepted: true)
Friendship.create!(requester_id: 14, requestee_id: 7, accepted: true)
Friendship.create!(requester_id: 14, requestee_id: 6, accepted: true)
Friendship.create!(requester_id: 14, requestee_id: 5, accepted: true)
Friendship.create!(requester_id: 13, requestee_id: 8, accepted: true)
Friendship.create!(requester_id: 13, requestee_id: 7, accepted: true)
Friendship.create!(requester_id: 13, requestee_id: 6, accepted: true)
Friendship.create!(requester_id: 13, requestee_id: 5, accepted: true)

Post.create!(author_id: 1, recipient_id: 1,
             content: 'Always a blast performing at Queensland Performing Arts Center. Thanks for the support, Australia!',
             picture: 'https://www.filepicker.io/api/file/zPNquN5RFuWPAYhnuEM4')
Post.create!(author_id: 2, recipient_id: 1,
             content: 'my calves are so sore from taking your class yesterday')
Post.create!(author_id: 6, recipient_id: 1,
             content: 'Great having you as a guest judge last week. Good luck on tour!')
Post.create!(author_id: 4, recipient_id: 1,
             content: 'You were amazing in NYC :)')
Post.create!(author_id: 1, recipient_id: 1,
             content: 'Check out Under Armour!',
             picture: 'https://www.filepicker.io/api/file/fqGDB2EcR6iT6viwwEuW')
Post.create!(author_id: 3, recipient_id: 4,
             content: 'Victorious at Blackpool 2014!',
             picture: 'https://www.filepicker.io/api/file/4G59ruRQPmmhFLNwIh4V')
Post.create!(author_id: 7, recipient_id: 7,
             content: '#fam #whatdoyouwantmos?',
             picture: 'https://www.filepicker.io/api/file/mDcmy63RquR4wHBMgV6g')
Post.create!(author_id: 10, recipient_id: 11,
             content: 'carpool to rehearsal tmrw?')
Post.create!(author_id: 14, recipient_id: 7,
             content: 'Awesome collabin\' with you! #dreamteam',
             picture: 'https://www.filepicker.io/api/file/QvF53aLTi0BoxYW44jyw')

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
Like.create!(user_id: 6, likable_type: 'Post', likable_id: 9)
Like.create!(user_id: 7, likable_type: 'Post', likable_id: 9)
Like.create!(user_id: 8, likable_type: 'Post', likable_id: 9)
Like.create!(user_id: 9, likable_type: 'Post', likable_id: 9)
