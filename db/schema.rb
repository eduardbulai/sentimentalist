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

ActiveRecord::Schema.define(:version => 20130528191623) do

  create_table "authentications", :force => true do |t|
    t.string   "provider",   :null => false
    t.string   "uid",        :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friend_lists", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "friend_status_texts", :force => true do |t|
    t.integer  "friend_id",       :null => false
    t.datetime "datetime_posted", :null => false
    t.text     "content"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "friends", :force => true do |t|
    t.string   "first_name",    :null => false
    t.string   "last_name",     :null => false
    t.integer  "friendlist_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "message_recipients", :force => true do |t|
    t.integer  "message_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "poke_recipients", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "poke_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pokes", :force => true do |t|
    t.integer  "user_id",              :null => false
    t.integer  "message_recipient_id", :null => false
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "private_messages", :force => true do |t|
    t.integer  "user_id",              :null => false
    t.integer  "message_recipient_id", :null => false
    t.datetime "datetime_sent",        :null => false
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "user_status_texts", :force => true do |t|
    t.integer  "user_id",         :null => false
    t.datetime "datetime_posted", :null => false
    t.text     "content"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name",   :null => false
    t.string   "last_name",    :null => false
    t.string   "email",        :null => false
    t.string   "password",     :null => false
    t.string   "current_city", :null => false
    t.datetime "last_login"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
