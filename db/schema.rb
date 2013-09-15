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

ActiveRecord::Schema.define(:version => 20130915182833) do

  create_table "announce_accounting", :force => true do |t|
    t.integer "announce_id"
    t.integer "watches"
    t.integer "detailed"
    t.integer "fav"
  end

  create_table "announces", :force => true do |t|
    t.string   "title"
    t.string   "desc"
    t.date     "action_date"
    t.float    "lg"
    t.float    "lt"
    t.string   "image"
    t.datetime "event_date"
    t.integer  "user_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "disabled",    :default => true,  :null => false
    t.string   "tag_1"
    t.string   "tag_2"
    t.string   "tag_3"
    t.boolean  "is_repeated", :default => false
  end

  create_table "docs", :force => true do |t|
    t.string   "key"
    t.text     "document"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "disabled",   :default => false
  end

  create_table "news", :force => true do |t|
    t.string   "title",                        :null => false
    t.string   "short_info",                   :null => false
    t.boolean  "disabled",   :default => true, :null => false
    t.text     "content",                      :null => false
    t.string   "image"
    t.integer  "user_id",                      :null => false
    t.float    "lt"
    t.float    "lg"
    t.string   "tag_1"
    t.string   "tag_2"
    t.string   "tag_3"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.date     "valid_to"
  end

  create_table "places", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id",     :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "disabled",     :default => false
    t.integer  "active_count", :default => 0,     :null => false
  end

  create_table "tests", :force => true do |t|
    t.string   "name"
    t.text     "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "e_mail"
    t.string   "password"
    t.string   "login"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "role",       :default => "subscriber"
    t.boolean  "disabled",   :default => false
  end

end
