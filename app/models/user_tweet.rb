class UserTweet < ActiveRecord::Base
  attr_accessible :datetime_tweeted, :text, :user_id, :tweet_id, :emotion, :polarity

  belongs_to :user, inverse_of: :user_tweets

  validates_presence_of :datetime_tweeted, :text, :user_id, :tweet_id, :emotion, :polarity

end


