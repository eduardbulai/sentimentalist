class UserTweet < ActiveRecord::Base
  attr_accessible :text,
    :user_id,
    :tweet_id,
    :emotion,
    :bayesian_emotion,
    :polarity

  belongs_to :user, inverse_of: :user_tweets

  validates_presence_of :text,
    :user_id,
    :tweet_id

end


