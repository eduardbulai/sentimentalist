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
			user.bayesian_emotion = EmotionGetter.get_bayesian_emotion(user,user)
			user.emotion = EmotionGetter.get_emotion(user)
			user.polarity = EmotionGetter.get_polarity(user)
			user.save!
		end

		def self.initialize_machine_learner(user)
			machine_learner = user.build_machine_learner
			machine_learner.save!
		end

		def self.initialize_follower(follower)
			f_user = follower.user
			follower.emotion = EmotionGetter.get_emotion(follower)
			follower.bayesian_emotion = EmotionGetter.get_bayesian_emotion(f_user,follower)
			follower.polarity= EmotionGetter.get_polarity(follower)
			follower.save!
		end

		def self.populate_user_tweets(user)
			user_timeline = Twitter.user_timeline(user.twitter_handle)
			user_timeline.each do |tweet|
				unless user.user_tweets.pluck(:tweet_id).include?(tweet.id)
					user.user_tweets.create!(
						text: tweet.text,
						tweet_id: tweet.id,
						bayesian_emotion: user.get_bayesian_emotion_of_tweet(tweet),
						emotion: user.get_tweet_emotion(tweet),
						polarity: user.get_tweet_polarity(tweet)
					)
				end
			end
		end

		def self.populate_followers(user)
			Twitter.followers(user.twitter_handle).each do |follower|
				unless user.followers.pluck(:twitter_id).include?(follower.id)
					user.followers.create!(
						name: follower.name,
		  			twitter_handle: follower.screen_name,
		  			twitter_id: follower.id
			  		)
				end
			end
		end

		def self.populate_follower_tweets(user)
			user.followers.each do |follower|
				follower_timeline = Twitter.user_timeline(follower)
				follower_timeline.each do |tweet|
					unless follower.follower_tweets.pluck(:tweet_id).include?(tweet.id)
						follower.follower_tweets.create!(
							text: tweet.text,
							tweet_id: tweet.id,
							)
					end
				end
			end
		end

end
