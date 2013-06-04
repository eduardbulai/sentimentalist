class UserTweet < ActiveRecord::Base
  attr_accessible :datetime_tweeted, :location, :text, :user_id


  belongs_to :user
  has_many :user_tweet_hashtags,:foreign_key => :user_tweet_id, :dependent => :destroy

  validates_presence_of :datetime_tweeted, :location, :text

end
