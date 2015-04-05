# Schema Information

## users
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
email           | string    | not null, unique
password_digest | string    | not null
session_token   | string    | not null, unique

## posts
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
author_id   | integer   | not null, foreign key (references users)
content     | text      | not null

## comments
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
author_id   | integer   | not null, foreign key (references users)
post_id     | integer   | not null, foreign key (references posts)
content     | string    | not null

## friendships
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
friend1_id  | integer   | not null, foreign key (references users)
friend2_id  | integer   | not null, foreign key (references users)

## likes
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
user_id     | integer   | not null, foreign key (references users)
likable_type| string    | not null, declares polymorphic interface (post or comment)
likable_id  | integer   | not null, foreign key (references posts or comments)
