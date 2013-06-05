class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid

  has_many :user_tweets, dependent: :destroy
  has_many :followers, dependent: :destroy

  def self.from_omniauth
  	user = where(auth.slice("provider","uid")).first || create_with_omniauth(auth)
  	user.oauth_token = auth["credentials"]["token"]
  	user.oauth_secret = auth["credentials"]["secret"]
  	user.save!
  	user
  end

  def self.create_with_omniauth(auth)
	  create! do |user|
	    user.provider = auth["provider"]
	    user.uid = auth["uid"]
	    user.name = auth["info"]["name"]
	  end
	end

	def twitter
	  @twitter ||= Twitter::Client.new(oauth_token: oauth_token, oauth_token_secret: oauth_secret)
	end
end
