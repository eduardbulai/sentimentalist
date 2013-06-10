require 'spec_helper'

FactoryGirl.define do

	sequence :tweet do |n|
    "here's a tweet#{n}"
  end

  sequence :name do |n|
  	"name#{n}"
  end

	factory :follower_tweet do
		text { generate(:tweet) }
		datetime_tweeted "2013-06-03 02:06:41"
		tweet_id "341375354683936768"
		created_at "2013-06-05 23:07:31"
    updated_at "2013-06-05 23:07:31"
    # follower_id 1
	end

	factory :user_tweet do
		text { generate(:tweet) }
		datetime_tweeted "2013-06-03 02:06:41"
		tweet_id "341375354683936768"
		created_at "2013-06-05 23:07:31"
    updated_at "2013-06-05 23:07:31"
    # user_id 1
	end

	factory :follower do
		name { generate(:name) }
		twitter_handle 'dsf@__'
		twitter_id '1392225116'
		location 'Boston'
		emotion_week 'joy'
    emotion_month 'sadness'
    emotion_year 'surprise'
    polarity_week '7.0'
    polarity_month '2.0'
    polarity_year '5.0'
    created_at "2013-06-04 23:07:31"
    updated_at "2013-06-09 23:07:31"
    factory :follower_with_tweets do
      after(:create) {|instance| create_list(:follower_tweet, 5, follower: instance) }
    end
	end

  factory :user do
  	name 'blarguser'
    uid '823121243'
    provider 'twitter'
    emotion_week 'joy'
    emotion_month 'sadness'
    emotion_year 'surprise'
    polarity_week '7.0'
    polarity_month '2.0'
    polarity_year '5.0'
    created_at "2013-06-04 23:07:31"
    updated_at "2013-06-09 23:07:31"
    factory :user_with_followers do
      after(:create) {|instance| create_list(:follower_with_tweets, 5, user: instance) }
    end
  end
end