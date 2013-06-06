class FollowerTweet < ActiveRecord::Base
  attr_accessible :datetime_tweeted, :text, :follower_id, :tweet_id

  belongs_to :follower
  has_many :follower_tweet_hashtags,:foreign_key => :follower_tweet_id, :dependent => :destroy

  validates_presence_of :datetime_tweeted, :text
end
