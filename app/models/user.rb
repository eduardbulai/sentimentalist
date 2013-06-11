class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :oauth_token, :oauth_secret, :emotion_week, :emotion_month, :emotion_year, :polarity_week, :polarity_month, :polarity_year

  has_many :user_tweets, dependent: :destroy
  has_many :followers, dependent: :destroy

  def self.from_omniauth(auth)
  	user = where(auth.slice("provider","uid")).first || create_with_omniauth(auth)
  	user.oauth_token = auth["credentials"]["token"]
  	user.oauth_secret = auth["credentials"]["secret"]
  	user.save!
  	user
  end

  def self.create_with_omniauth(auth)
	  user = create! do |user|
	    user.provider = auth["provider"]
	    user.uid = auth["uid"]
	    user.name = auth["info"]["name"]
	  end
    TwitterApi.get_twitter_stuff(user)
    user
	end

	def self.twitter
	  @twitter ||= Twitter::Client.new(oauth_token: self.oauth_token, oauth_token_secret: self.oauth_secret)
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

  def get_new_user_tweets
    begin
        user_timeline = Twitter.user_timeline
    rescue
        user_timeline = nil
    end
    if user_timeline
      user_timeline.each do |tweet|
        until self.user_tweets.pluck(:tweet_id).include?(tweet.id)
          self.user_tweets.create!(
            text: tweet.text,
            tweet_id: tweet.id,
            datetime_tweeted: tweet.created_at
            )
        end
      end
    end
  end

  def get_new_follower_tweets
    begin
        user_timeline = Twitter.user_timeline
    rescue
        user_timeline = nil
    end
    if user_timeline
      user_timeline.each do |tweet|
        until self.follower_tweets.pluck(:tweet_id).include?(tweet.id)
          self.user_tweets.create!(
            text: tweet.text,
            tweet_id: tweet.id,
            datetime_tweeted: tweet.created_at
            )
        end
      end
    end
  end

  def update_user_tweets
    tweets = self.user_tweets
    tweets.each do |t|
      if tweet.datetime_tweeted < Time.now - 1.year
        tweets.delete(t)
      end
    end
    self.get_new_user_tweets
  end

  def update_follower_tweets
    tweets = self.user_tweets
    tweets.each do |t|
      if tweet.datetime_tweeted < Time.now - 1.year
        tweets.delete(t)
      end
    end
    self.get_new_user_tweets
  end

end
