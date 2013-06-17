class TwitterApi < ActiveRecord::Base

	attr_accessible :user

	def self.get_twitter_stuff user
		populate_user_tweets user
		populate_followers user
		populate_follower_tweets user
		initialize_user user.id
		user.followers.each {|follower| initialize_follower follower.id}
		initialize_machine_learner(user)
	end

	def self.initialize_user user_id
		user = User.find_by_id(user_id)
		begin
				user_tweets_exist = !user.user_tweets.empty?
		rescue
				user_tweets_exist = false
		end
		if user_tweets_exist
			user.emotion_week = user.emotion_for_timeframe "week"
			user.emotion_month = user.emotion_for_timeframe "month"
			user.emotion_year = user.emotion_for_timeframe "year"
			user.polarity_week = user.polarity_for_timeframe "week"
			user.polarity_month = user.polarity_for_timeframe "month"
			user.polarity_year = user.polarity_for_timeframe "year"
			user.save!
		end
	end

	def self.initialize_machine_learner user
		user.machine_learner.create!(
			user_id: user.id
			)
	end

	def self.initialize_follower follower_id
		follower = Follower.find_by_id(follower_id)
		follower.emotion_week = follower.emotion_for_timeframe("week")
		follower.emotion_month = follower.emotion_for_timeframe("month")
		follower.emotion_year = follower.emotion_for_timeframe("year")
		follower.polarity_week = follower.polarity_for_timeframe("week")
		follower.polarity_month = follower.polarity_for_timeframe("month")
		follower.polarity_year = follower.polarity_for_timeframe("year")
		follower.save!
	end

	def self.populate_user_tweets user
		begin
				user_timeline = Twitter.user_timeline(user.twitter_handle)
		rescue
				user_timeline = nil
		end
		if user_timeline
			user_timeline.each do |tweet|
				unless user.user_tweets.pluck(:tweet_id).include?(tweet.id)
					user.user_tweets.create!(
						text: tweet.text,
						tweet_id: tweet.id,
						datetime_tweeted: tweet.created_at,
						emotion: user.get_tweet_emotion(tweet),
						polarity: user.get_tweet_polarity(tweet)
						)
				end
			end
		end
	end

	def self.populate_followers user
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

	def self.populate_follower_tweets user
		user.followers.each do |follower|
			begin
				follower_timeline = Twitter.user_timeline((follower.twitter_id).to_i)
			rescue
				follower_timeline = nil
			end
			if follower_timeline
				follower_timeline.each do |tweet|
					unless user.user_tweets.pluck(:tweet_id).include?(tweet.id)
						follower.follower_tweets.create!(
							text: tweet.text,
							tweet_id: tweet.id,
							datetime_tweeted: tweet.created_at
							)
					end
				end
			end
		end
	end


end