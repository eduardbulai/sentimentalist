class Follower < ActiveRecord::Base

  include EmotionGetter
  include TweetCreator

  attr_accessible :name,
    :twitter_handle,
    :user_id,
    :twitter_id,
    :emotion,
    :bayesian_emotion,
    :polarity

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

  def create_follower_tweet(tweet)
    self.follower_tweets.create!(
      text: tweet.text,
      tweet_id: tweet.id,
    )
  end

  def get_stored_follower_tweet_ids
    stored_tweets = self.follower_tweets
    stored_tweets.pluck(:tweet_id)
  end

end
