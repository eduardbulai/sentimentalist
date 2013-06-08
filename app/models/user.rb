class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :oauth_token, :oauth_secret

  has_many :user_tweets, dependent: :destroy
  has_many :followers, dependent: :destroy

  def self.from_omniauth(auth)
  	user = where(auth.slice("provider","uid")).first || create_with_omniauth(auth)
  	user.oauth_token = auth["credentials"]["token"]
  	user.oauth_secret = auth["credentials"]["secret"]
  	user.save!
    if user == User.last
      TwitterApi.get_twitter_stuff(user)
    end
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

end
