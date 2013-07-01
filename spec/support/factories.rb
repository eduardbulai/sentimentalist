require 'spec_helper'

FactoryGirl.define do

	sequence :tweet do |n|
    "here's a tweet#{n}"
  end

  sequence :name do |n|
  	"name#{n}"
  end

  factory :machine_learner do
    name "joy or anger or fear or disgust or surprise or ambiguous"
    ignore_words Stopwords.stopwords
    stemming true
  end

	factory :follower_tweet do
		text { generate(:tweet) }
		tweet_id "341375354683936768"
		created_at "2013-06-05 23:07:31"
    updated_at "2013-06-05 23:07:31"
	end

	factory :user_tweet do
		text { generate(:tweet) }
		tweet_id "17060"
    emotion "joy"
    bayesian_emotion "fear"
    polarity 8
		created_at "2013-06-05 23:07:31"
    updated_at "2013-06-05 23:07:31"
	end

	factory :follower do
		name { generate(:name) }
		twitter_handle 'dsf@__'
		twitter_id '1392225116'
		emotion 'joy'
    bayesian_emotion 'anger'
    polarity '7.0'
    created_at "2013-06-04 23:07:31"
    updated_at "2013-06-09 23:07:31"
    factory :follower_with_tweets do
      after(:create) {|instance| create_list(:follower_tweet, 5, follower: instance) }
    end
    trait :with_screen_name do
      screen_name "@hickory"
    end
	end

  factory :user do
  	name 'blarguser'
    uid '823121243'
    provider 'twitter'
    twitter_handle 'test_handle'
    oauth_token 'test_token'
    oauth_secret 'test_secret'
    created_at "2013-06-04 23:07:31"
    updated_at "2013-06-09 23:07:31"
    resque_complete true
    trait :with_emotions do
      bayesian_emotion 'anger'
      emotion 'disgust'
      polarity '8.0'
    end
    factory :user_with_followers_and_machine_learner do
      after(:create) {|instance| create_list(:follower_with_tweets, 5, user: instance) }
      after(:create) {|instance| create_list(:user_tweet, 5, user: instance) }
      after(:create) {|instance| create(:machine_learner, user: instance) }
    end
  end
end
