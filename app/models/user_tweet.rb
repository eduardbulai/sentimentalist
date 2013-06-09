class UserTweet < ActiveRecord::Base
  attr_accessible :datetime_tweeted, :text, :user_id, :tweet_id, :emotion, :polarity

  belongs_to :user
  has_many :user_tweet_hashtags,:foreign_key => :user_tweet_id, :dependent => :destroy

  validates_presence_of :datetime_tweeted, :text, :user_id, :tweet_id

  def check_time_elapsed_since_datetime_tweeted
  	 if (Time.now - self.datetime_tweeted) <= 1.week
  	 	return "week"
  	 elsif (Time.now - self.datetime_tweeted) <= 1.month
  	 	return "month"
  	 elsif (Time.now - self.datetime_tweeted) <= 1.year
  	 	return "year"
  	 end
  end

end
