class FollowerTweet < ActiveRecord::Base
  attr_accessible :datetime_tweeted, :text, :follower_id, :tweet_id, :emotion, :polarity

  belongs_to :follower
  has_many :follower_tweet_hashtags,:foreign_key => :follower_tweet_id, :dependent => :destroy

end
