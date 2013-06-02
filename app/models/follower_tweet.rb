class FollowerTweet < ActiveRecord::Base
  attr_accessible :datetime_tweeted, :location, :text

  belongs_to :follower
  has_many :follower_tweet_hashtags, :dependent => :destroy

  validates_presence_of :datetime_tweeted, :location, :text
end
