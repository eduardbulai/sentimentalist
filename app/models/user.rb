class User < ActiveRecord::Base

  include EmotionGetter
  include TweetCreator

  attr_accessible :name,
    :twitter_handle,
    :provider,
    :uid,
    :oauth_token,
    :oauth_secret,
    :emotion,
    :bayesian_emotion,
    :polarity,
    :resque_complete

  has_many :user_tweets,
    dependent: :destroy
  has_many :followers,
    dependent: :destroy
  has_one :machine_learner,
    foreign_key: :user_id,
      dependent: :destroy

  validates_presence_of :name,
    :twitter_handle,
    :provider,
    :uid,
    :oauth_token,
    :oauth_secret


	def tweeter
	  @tweeter ||= Twitter::Client.new(oauth_token: self.oauth_token, oauth_token_secret: self.oauth_secret)
	end

  def concatenated_tweets
    tweets = self.user_tweets.limit(300)
    tweets.pluck(:text).join(" ")
  end

  def get_tweet_emotion(tweet)
    text = tweet.text
    SadPanda.emotion(text)
  end

  def bayesian_emotion_of_tweet(tweet)
    text = tweet.text
    user_classifier = self.machine_learner.classifier
    user_classifier.classify(text).to_s
  end

  def tweet_polarity(tweet)
    text = tweet.text
    SadPanda.polarity(text)
  end

  def twitter_timeline
    Twitter.user_timeline(self.twitter_handle)
  end

  def follower_twitter_timelines
    Twitter.followers(self.twitter_handle)
  end

  def stored_user_tweet_ids
    stored_tweets = self.user_tweets
    stored_tweets.pluck(:tweet_id)
  end

  def stored_follower_ids
    stored_followers = self.followers
    stored_followers.pluck(:twitter_id)
  end

  def store_user_tweets(user_timeline, stored_ids)
    user_timeline.each do |tweet|
      unless self.object_in_database(stored_ids, tweet)
        self.create_user_tweet(tweet)
      end
    end
  end

  def store_follower_tweets(follower, follower_timeline, stored_ids)
    follower_timeline.each do |tweet|
      unless follower.object_in_database(stored_ids, tweet)
        follower.create_follower_tweet(tweet)
      end
    end
  end

  def store_followers(user, follower_timelines, stored_ids)
    follower_timelines.each do |follower|
      unless user.object_in_database(stored_ids, follower)
        user.create_follower(follower)
      end
    end
  end

  def create_user_tweet(tweet)
    self.user_tweets.create!(
      text: tweet.text,
      tweet_id: tweet.id,
      bayesian_emotion: self.bayesian_emotion_of_tweet(tweet),
      emotion: self.get_tweet_emotion(tweet),
      polarity: self.tweet_polarity(tweet)
    )
  end

  def create_follower(follower)
    self.followers.create!(
      name: follower.name,
      twitter_handle: follower.screen_name,
      twitter_id: follower.id
    )
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
