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

ActiveRecord::Schema.define(version: 20161220070820) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.date     "date"
    t.string   "location"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "min_age"
    t.integer  "max_age"
    t.integer  "school_id"
    t.integer  "price"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "bg_img"
    t.integer  "seats",       default: 0, null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "events", ["school_id"], name: "index_events_on_school_id", using: :btree

  create_table "individuals", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "avatar"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "bg_img"
  end

  add_index "individuals", ["user_id"], name: "index_individuals_on_user_id", unique: true, using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.string   "category"
    t.string   "logo"
    t.integer  "reviews",     default: 0
    t.integer  "min_age"
    t.integer  "max_age"
    t.string   "cover"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.string   "bg_img"
    t.string   "phone"
    t.string   "website"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "schools", ["user_id"], name: "index_schools_on_user_id", unique: true, using: :btree

  create_table "tickets", force: :cascade do |t|
    t.integer "event_id",      null: false
    t.integer "individual_id", null: false
  end

  add_index "tickets", ["event_id"], name: "index_tickets_on_event_id", using: :btree
  add_index "tickets", ["individual_id"], name: "index_tickets_on_individual_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "role"
  end

  add_foreign_key "events", "schools"
end
