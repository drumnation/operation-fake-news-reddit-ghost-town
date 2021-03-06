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

ActiveRecord::Schema.define(version: 20170423192650) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.integer  "user_id"
    t.integer  "submission_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "submissions", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.string   "description"
    t.integer  "score",       default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "image",       default: "default.jpg"
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "gender"
    t.string   "email"
    t.string   "password"
    t.string   "image"
    t.string   "city"
    t.string   "zip"
    t.string   "book_genre"
    t.string   "chuck_norris_fact"
    t.string   "beer_name"
    t.string   "food_ingredient"
    t.string   "gameofthrones_house"
    t.string   "harry_potter_location"
    t.string   "job_key_skill"
    t.string   "space_planet"
    t.string   "name"
    t.integer  "user_score",            default: 0
    t.float    "latitude"
    t.float    "longitude"
    t.string   "rockband_name"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "submission_id"
    t.integer  "upvote"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
