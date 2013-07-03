class FollowerTweet < ActiveRecord::Base
  attr_accessible :text, :follower_id, :tweet_id

  belongs_to :follower,
    inverse_of: :follower_tweets

  validates_presence_of :text,
    :follower_id,
    :tweet_id

end
