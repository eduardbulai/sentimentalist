class TweetUpdater

  include TwitterApi

	@queue = :tweet_update_queue

	def self.perform(user_id)
		user = User.find_by_id(user_id)
    #dp - what happens if the user no longer exists?
		update_tweets(user)
	end

	def self.update_tweets(user)
		populate_user_tweets(user)
    populate_followers(user)
    populate_follower_tweets(user)
	end

end
