# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150412184001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "author_id",  null: false
    t.integer  "post_id",    null: false
    t.string   "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.integer  "requester_id",                 null: false
    t.integer  "requestee_id",                 null: false
    t.boolean  "accepted",     default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["requestee_id"], name: "index_friendships_on_requestee_id", using: :btree
  add_index "friendships", ["requester_id"], name: "index_friendships_on_requester_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.string   "likable_type", null: false
    t.integer  "likable_id",   null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "likes", ["likable_id"], name: "index_likes_on_likable_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "author_id",    null: false
    t.integer  "recipient_id", null: false
    t.text     "content",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "picture"
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id", using: :btree
  add_index "posts", ["recipient_id"], name: "index_posts_on_recipient_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "fname",           null: false
    t.string   "lname",           null: false
    t.string   "dance_style",     null: false
    t.string   "gender",          null: false
    t.string   "company",         null: false
    t.string   "profile_picture"
    t.string   "cover_photo"
    t.string   "nickname"
  end

  add_index "users", ["company"], name: "index_users_on_company", using: :btree
  add_index "users", ["dance_style"], name: "index_users_on_dance_style", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["fname"], name: "index_users_on_fname", using: :btree
  add_index "users", ["lname"], name: "index_users_on_lname", using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree

end
