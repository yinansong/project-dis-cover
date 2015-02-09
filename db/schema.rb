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

ActiveRecord::Schema.define(version: 20150209202301) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collectors", force: true do |t|
    t.string   "headshot_url"
    t.string   "name",                null: false
    t.string   "email",               null: false
    t.string   "password_digest",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "manholecovers", force: true do |t|
    t.string   "country",                                                          null: false
    t.string   "region",                                                           null: false
    t.string   "city",                                                             null: false
    t.integer  "year",                                                             null: false
    t.string   "color",                                                            null: false
    t.string   "keywords",                 default: [],                                         array: true
    t.string   "notes",                    default: "Just another manhole cover."
    t.boolean  "featured",                 default: false
    t.integer  "collector_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "manhole_img_file_name"
    t.string   "manhole_img_content_type"
    t.integer  "manhole_img_file_size"
    t.datetime "manhole_img_updated_at"
  end

  add_index "manholecovers", ["keywords"], name: "index_manholecovers_on_keywords", using: :gin

  create_table "roles", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

end
