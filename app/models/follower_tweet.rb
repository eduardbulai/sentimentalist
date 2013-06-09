class FollowerTweet < ActiveRecord::Base
  attr_accessible :datetime_tweeted, :text, :follower_id, :tweet_id

  belongs_to :follower
  has_many :follower_tweet_hashtags,:foreign_key => :follower_tweet_id, :dependent => :destroy

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
