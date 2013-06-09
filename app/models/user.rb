class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :oauth_token, :oauth_secret

  has_many :user_tweets, dependent: :destroy
  has_many :followers, dependent: :destroy

  def self.from_omniauth(auth)
  	user = where(auth.slice("provider","uid")).first || create_with_omniauth(auth)
  	user.oauth_token = auth["credentials"]["token"]
  	user.oauth_secret = auth["credentials"]["secret"]
  	user.save!
    TwitterApi.get_twitter_stuff(user)
  	user
  end

  def self.create_with_omniauth(auth)
	  create! do |user|
	    user.provider = auth["provider"]
	    user.uid = auth["uid"]
	    user.name = auth["info"]["name"]
	  end
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

end
