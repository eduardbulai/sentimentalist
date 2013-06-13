class User < ActiveRecord::Base
  attr_accessible :name, :twitter_handle, :provider, :uid, :oauth_token, :oauth_secret, :emotion_week, :emotion_month, :emotion_year, :polarity_week, :polarity_month, :polarity_year

  has_many :user_tweets, dependent: :destroy
  has_many :followers, dependent: :destroy

  def self.from_omniauth(auth)
  	where(auth.slice("provider", "uid")).first || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
	  user = create! do |user|
	    user.provider = auth["provider"]
      user.uid = auth["uid"]
	    user.name = auth["info"]["name"]
      user.twitter_handle = auth["info"]["nickname"]
      user.oauth_token = auth['extra']['access_token'].params[:oauth_token]
      user.oauth_secret = auth['extra']['access_token'].params[:oauth_token_secret]
	  end
    TwitterApi.get_twitter_stuff(user)
    user
	end

	def tweeter
	  @tweeter ||= Twitter::Client.new(oauth_token: self.oauth_token, oauth_token_secret: self.oauth_secret)
	end

  def self.check_time_elapsed_since_datetime_tweeted
    if self.where("datetime_tweeted <= ?","#{Time.now-1.week}")
      return "week"
    elsif  self.where("datetime_tweeted <= ?","#{Time.now-1.month}")
      return "month"
    elsif  self.where("datetime_tweeted <= ?","#{Time.now-1.year}")
      return "year"
    end
  end

  def concatonate_tweets timeframe
    if timeframe == "week"
      all_tweets = self.user_tweets.where("datetime_tweeted <= ?",Time.now-1.week)
    elsif timeframe == "month"
      all_tweets = self.user_tweets.where("datetime_tweeted <= ?",Time.now-1.month)
    else
      all_tweets = self.user_tweets.where("datetime_tweeted <= ?",Time.now-1.year)
    end
    all_tweets.pluck(:text).join(" ")
  end

  def emotion_for_timeframe timeframe # week, month, or year
    concatonated_tweets = self.concatonate_tweets timeframe
    SadPanda.emotion(concatonated_tweets)
  end

  def polarity_for_timeframe timeframe # week, month, or year
    concatonated_tweets = self.concatonate_tweets timeframe
    SadPanda.polarity(concatonated_tweets)
  end

end
