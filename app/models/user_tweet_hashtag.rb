class UserTweetHashtag < ActiveRecord::Base
  attr_accessible :tag, :user_tweet_id

  belongs_to :follower_tweet

  validates_presence_of :tag

end