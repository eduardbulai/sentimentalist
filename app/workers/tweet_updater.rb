class TweetUpdater

	@queue = :tweet_update_queue

	def self.perform
		users = User.all

		users.each do |u|
			u.update_user_tweets
			u.update_follower_tweet
		end

	end
end
