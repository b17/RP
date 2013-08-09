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

ActiveRecord::Schema.define(:version => 20130807093719) do

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
    t.boolean  "disabled",    :default => false, :null => false
    t.string   "tag_1"
    t.string   "tag_2"
    t.string   "tag_3"
  end

  create_table "news", :force => true do |t|
    t.string   "title",                        :null => false
    t.string   "short_info",                   :null => false
    t.boolean  "disabled",   :default => true, :null => false
    t.text     "content",                      :null => false
    t.string   "image",                        :null => false
    t.integer  "user_id",                      :null => false
    t.float    "lt"
    t.float    "lg"
    t.string   "tag_1"
    t.string   "tag_2"
    t.string   "tag_3"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "disabled",   :default => false
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
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "role",       :default => "admin"
  end

end
