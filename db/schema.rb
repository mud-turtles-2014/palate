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

ActiveRecord::Schema.define(version: 20141022024753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_wines", force: true do |t|
    t.boolean  "is_attending"
    t.integer  "event_id"
    t.integer  "wine_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name",       null: false
    t.string   "location",   null: false
    t.datetime "date",       null: false
    t.datetime "time",       null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tastings", force: true do |t|
    t.integer  "red_fruits"
    t.integer  "white_fruits"
    t.integer  "minerality"
    t.integer  "oak"
    t.integer  "dry"
    t.integer  "acid"
    t.integer  "tannin"
    t.integer  "alcohol"
    t.integer  "climate"
    t.integer  "country"
    t.integer  "red_grape"
    t.integer  "white_grape"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fruit_condition"
    t.integer  "event_wine_id"
    t.text     "tasting_notes"
    t.boolean  "is_blind",        default: true
  end

  create_table "user_results", force: true do |t|
    t.integer  "tasting_id"
    t.string   "category"
    t.boolean  "is_correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wines", force: true do |t|
    t.string   "name",        null: false
    t.string   "color",       null: false
    t.text     "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "grape"
    t.string   "country"
  end

end
