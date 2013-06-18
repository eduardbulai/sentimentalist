class Follower < ActiveRecord::Base
  attr_accessible :name, :location, :twitter_handle, :user_id, :twitter_id, :emotion_week, :emotion_month, :emotion_year, :polarity_week, :polarity_month, :polarity_year

  has_many :follower_tweets, foreign_key: :follower_id, dependent: :destroy
  belongs_to :user, inverse_of: :followers

  validates_presence_of :name,
    :twitter_handle,
    :user_id,
    :twitter_id,
    :emotion_week,
    :emotion_month,
    :emotion_year,
    :polarity_week,
    :polarity_month,
    :polarity_year

  def concatonate_tweets_since(timeframe)
    offset = Time.now - 1.send(timeframe)
    self.follower_tweets.where("datetime_tweeted <= ?", offset).pluck(:text).join(" ")
  end

  def emotion_for_timeframe(timeframe) # week, month, or year
  	concatonated_tweets = self.concatonate_tweets_since timeframe
  	SadPanda.emotion(concatonated_tweets)
  end

  def polarity_for_timeframe(timeframe) # week, month, or year
  	concatonated_tweets = self.concatonate_tweets_since timeframe
  	SadPanda.polarity(concatonated_tweets)
  end

end
