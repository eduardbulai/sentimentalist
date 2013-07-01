class TwitterApi < ActiveRecord::Base

	attr_accessible :user

	def self.get_twitter_stuff(user)
		initialize_machine_learner(user)
		populate_user_tweets(user)
		populate_followers(user)
		populate_follower_tweets(user)
		initialize_user(user)
		user.followers.each {|follower| initialize_follower(follower)}
	end

	private

		def self.initialize_user(user)
			user.bayesian_emotion = user.get_bayesian_emotion(user,user)
			user.emotion = user.get_emotion(user)
			user.polarity = user.get_polarity(user)
			user.save!
		end

		def self.initialize_machine_learner(user)
			machine_learner = user.build_machine_learner
			machine_learner.save!
		end

		def self.initialize_follower(follower)
			f_user = follower.user
			follower.emotion = follower.get_emotion(follower)
			follower.bayesian_emotion = follower.get_bayesian_emotion(f_user,follower)
			follower.polarity= follower.get_polarity(follower)
			follower.save!
		end

		def self.populate_user_tweets(user)
			user_timeline = user.get_twitter_timeline
			stored_ids = user.get_stored_user_tweet_ids
			user.store_user_tweets(user_timeline, stored_ids)
		end

		def self.populate_followers(user)
			follower_timelines = user.get_follower_twitter_timelines
			stored_ids = user.get_stored_follower_ids
			user.store_followers(follower_timelines, stored_ids)
		end

		def self.populate_follower_tweets(user)
			followers = user.followers
			user.followers.each do |follower|
				follower_timeline = follower.get_twitter_timeline
				stored_ids = self.get_stored_follower_tweet_ids
				follower.store_follower_tweets(follower_timeline, stored_ids)
			end
		end

end
