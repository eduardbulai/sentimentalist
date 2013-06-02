class UserTweet < ActiveRecord::Base
  attr_accessible :datetime_tweeted, :location, :text


  belongs_to :user
  has_many :user_tweet_hashtags, :dependent => :destroy

  validates_presence_of :datetime_tweeted, :location, :text

end
