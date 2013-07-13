module TwitterApi

	def self.get_twitter_stuff(user)
    user.set_machine_learner
    user.populate_user_tweets
    user.populate_followers
    user.populate_follower_tweets
    user.set_default_emotion_attributes
		user.followers.each {|follower| follower.initialize_follower}
	end
 
end
