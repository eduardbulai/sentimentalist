class User < ActiveRecord::Base

  include EmotionTimeframeable

  attr_accessible :name,
    :twitter_handle,
    :provider,
    :uid,
    :oauth_token,
    :oauth_secret,
    :emotion_week,
    :emotion_month,
    :emotion_year,
    :bayesian_emotion_week,
    :bayesian_emotion_month,
    :bayesian_emotion_year,
    :polarity_week,
    :polarity_month,
    :polarity_year

  has_many :user_tweets, dependent: :destroy
  has_many :followers, dependent: :destroy
  has_one :machine_learner, foreign_key: :user_id, dependent: :destroy

  validates_presence_of :name,
    :twitter_handle,
    :provider,
    :uid,
    :oauth_token,
    :oauth_secret


	def tweeter
	  @tweeter ||= Twitter::Client.new(oauth_token: self.oauth_token, oauth_token_secret: self.oauth_secret)
	end

  def concatonate_tweets_since(timeframe)
    offset = Time.now - 1.send(timeframe)
    user_tweets.where("datetime_tweeted >= ?", offset).pluck(:text).join(" ")
  end

  def get_tweet_emotion(tweet)
    text = tweet.text
    SadPanda.emotion(text)
  end

  def get_bayesian_emotion(tweet)
    text = tweet.text
    user_classifier = self.machine_learner.build_classifier
    user_classifier.classify(text).to_s
  end

  def get_tweet_polarity(tweet)
    text = tweet.text
    SadPanda.polarity(text)
  end

  class << self

    def from_omniauth(auth)
      where(auth.slice("provider", "uid")).first || create_with_omniauth(auth)
    end

    def create_with_omniauth(auth)
      user = create! do |user|
        user.provider = auth["provider"]
        user.uid = auth["uid"]
        user.name = auth["info"]["name"]
        user.twitter_handle = auth["info"]["nickname"]
        user.oauth_token = auth['extra']['access_token'].params[:oauth_token]
        user.oauth_secret = auth['extra']['access_token'].params[:oauth_token_secret]
      end
      Resque.enqueue(SignInHelper, user.id)
      user
    end

  end

end
