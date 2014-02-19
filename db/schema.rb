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

ActiveRecord::Schema.define(version: 20140218021144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: true do |t|
    t.string  "title"
    t.string  "subtitle"
    t.string  "path"
    t.text    "boundary_encoded_points_string"
    t.integer "level"
    t.integer "se_id"
    t.integer "se_parent_id"
  end

  create_table "favorites", force: true do |t|
    t.integer "listing_id"
    t.integer "user_id"
  end

  create_table "listings", force: true do |t|
    t.integer "zip"
    t.integer "beds"
    t.integer "baths"
    t.integer "min_price"
    t.integer "max_price"
    t.integer "area_id"
  end

  create_table "users", force: true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
  end

end
