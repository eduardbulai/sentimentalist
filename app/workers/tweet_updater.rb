class TweetUpdater

	@queue = :tweet_update_queue

	def self.perform(user_id)

		user = User.find_by_id(user_id)
		update_tweets(user)

	end

	def self.update_tweets(user)
		update_user_tweets(user)
		update_follower_tweets(user)
	end

	def self.update_user_tweets(user)
		get_new_user_tweets(user)
	end

	def self.update_follower_tweets(user)
		user.followers.find_each do |follower|
			get_new_follower_tweets follower
		end
	end

  def self.get_new_user_tweets(user)
    user_timeline = Twitter.user_timeline(user.twitter_handle)
    user_timeline.each do |tweet|
      unless user.user_tweets.pluck(:tweet_id).include?(tweet.id)
        user.user_tweets.create!(
          text: tweet.text,
          tweet_id: tweet.id
          )
      end
    end
  end

  def self.get_new_follower_tweets(follower)
    user_timeline = Twitter.user_timeline(follower.twitter_handle)
    user_timeline.each do |tweet|
      unless follower.follower_tweets.pluck(:tweet_id).include?(tweet.id)
        follower.follower_tweets.create!(
          text: tweet.text,
          tweet_id: tweet.id
          )
      end
    end
  end

end
