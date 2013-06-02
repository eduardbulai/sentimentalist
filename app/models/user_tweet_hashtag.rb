class UserTweetHashtag < ActiveRecord::Base
  attr_accessible :tag

  belongs_to :follower_tweet

  validates_presence_of :tag

end