class TweetUpdater

  extend Resque::Plugins::Heroku

	@queue = :tweet_update_queue

	def self.perform(user_id)

		user = User.find_by_id(user_id)
		update_tweets(user)

	end

	def self.update_tweets user
		update_user_tweets user
		update_follower_tweets user
	end

	def self.update_user_tweets user
		remove_old_user_tweets user
		get_new_user_tweets user
		#user.tweets_updated = true
	end

	def self.update_follower_tweets user
		user.followers.each do |follower|
			remove_old_follower_tweets follower
			get_new_follower_tweets follower
		end
	end

	def self.remove_old_user_tweets user
    tweets = user.user_tweets
    tweets.each do |tweet|
      if tweet.datetime_tweeted < Time.now - 1.year
        tweets.delete(tweet)
      end
    end
  end

  def self.remove_old_follower_tweets follower
    tweets = follower.follower_tweets
    tweets.each do |tweet|
      if tweet.datetime_tweeted < Time.now - 1.year
        tweets.delete(tweet)
      end
    end
  end

  def self.get_new_user_tweets user
    begin
        user_timeline = Twitter.user_timeline(user.twitter_id)
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

  def self.get_new_follower_tweets follower
    begin
        user_timeline = Twitter.user_timeline(follower.twitter_id)
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

end
