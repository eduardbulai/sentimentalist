class FollowerTweetHashtag < ActiveRecord::Base
  attr_accessible :tag, :follower_tweet_id

  belongs_to :follower_tweet

  validates_presence_of :tag
end
