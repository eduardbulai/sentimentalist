class Follower < ActiveRecord::Base

  include EmotionGetter

  attr_accessible :name,
    :twitter_handle,
    :user_id,
    :twitter_id,
    :emotion,
    :bayesian_emotion,
    :polarity,
    :bayesian_polarity

  has_many :follower_tweets,
    foreign_key:
    :follower_id,
    dependent: :destroy

  belongs_to :user,
    inverse_of: :followers

  validates_presence_of :name,
    :twitter_handle,
    :user_id,
    :twitter_id

  def concatonate_tweets
    self.follower_tweets.pluck(:text).join(" ")
  end

end
