class FollowerTweet < ActiveRecord::Base
  attr_accessible :datetime_tweeted, :text, :follower_id, :tweet_id

  belongs_to :follower, inverse_of: :follower_tweets

  validates_presence_of :datetime_tweeted,
    :text,
    :follower_id,
    :tweet_id

end
