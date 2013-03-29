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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130327040608) do

  create_table "critics", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "genre_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "critics", ["genre_id"], :name => "index_critics_on_genre_id"

  create_table "critics_genres", :id => false, :force => true do |t|
    t.integer "critic_id"
    t.integer "genre_id"
  end

  add_index "critics_genres", ["critic_id", "genre_id"], :name => "index_critics_genres_on_critic_id_and_genre_id"
  add_index "critics_genres", ["genre_id", "critic_id"], :name => "index_critics_genres_on_genre_id_and_critic_id"

  create_table "genres", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reviews", :force => true do |t|
    t.integer  "work_id"
    t.integer  "critic_id"
    t.integer  "score"
    t.string   "url"
    t.date     "published_on"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "reviews", ["critic_id"], :name => "index_reviews_on_critic_id"
  add_index "reviews", ["work_id"], :name => "index_reviews_on_work_id"

  create_table "works", :force => true do |t|
    t.integer  "genre_id"
    t.string   "title"
    t.date     "released_on"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "works", ["genre_id"], :name => "index_works_on_genre_id"

end
