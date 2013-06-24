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

ActiveRecord::Schema.define(:version => 20130623204617) do

  create_table "follower_tweet_hashtags", :force => true do |t|
    t.string   "tag"
    t.integer  "follower_tweet_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "follower_tweets", :force => true do |t|
    t.text     "text",             :null => false
    t.datetime "datetime_tweeted", :null => false
    t.integer  "follower_id",      :null => false
    t.string   "tweet_id",         :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "followers", :force => true do |t|
    t.string   "name",                   :null => false
    t.string   "twitter_handle",         :null => false
    t.string   "location"
    t.integer  "user_id",                :null => false
    t.string   "twitter_id",             :null => false
    t.string   "emotion_week"
    t.string   "emotion_month"
    t.string   "emotion_year"
    t.string   "polarity_week"
    t.string   "polarity_month"
    t.string   "polarity_year"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "bayesian_emotion_week"
    t.string   "bayesian_emotion_month"
    t.string   "bayesian_emotion_year"
  end

  create_table "machine_learners", :force => true do |t|
    t.boolean  "stemming"
    t.string   "name"
    t.text     "ignore_words"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.text     "ccount"
    t.text     "wcount"
    t.boolean  "trained"
  end

  create_table "user_tweet_hashtags", :force => true do |t|
    t.string   "tag",           :null => false
    t.integer  "user_tweet_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "user_tweets", :force => true do |t|
    t.text     "text",             :null => false
    t.datetime "datetime_tweeted", :null => false
    t.integer  "user_id",          :null => false
    t.string   "tweet_id",         :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "emotion"
    t.integer  "polarity"
    t.string   "bayesian_emotion"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "uid"
    t.string   "provider"
    t.string   "emotion_week"
    t.string   "emotion_month"
    t.string   "emotion_year"
    t.string   "polarity_week"
    t.string   "polarity_month"
    t.string   "polarity_year"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.string   "twitter_handle"
    t.string   "bayesian_emotion_week"
    t.string   "bayesian_emotion_month"
    t.string   "bayesian_emotion_year"
  end

end
