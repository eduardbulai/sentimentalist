class TwitterApi < ActiveRecord::Base

	attr_accessible :user

	def initialize user
		populate_user_tweets user
		populate_followers user
		populate_follower_tweets user
		# populate_user_tweet_hashtags
		# populate_follower_tweet_hashtags
	end

	def self.populate_user_tweets user
		Twitter.user_timeline.each do |tweet|
			user.user_tweets.create!(
				text: tweet.text,
				tweet_id: tweet.id,
				user_id: user.id,
				datetime_tweeted: tweet.created_at
				)
		end
	end

	def self.populate_user_tweet_hashtags user
	end

	def self.populate_follower_tweet_hashtags user
	end

	def self.populate_followers user
		Twitter.followers(Twitter.user).each do |follower|
			unless exists?(follower_id: follower.id)
				user.followers.create!(
					name: follower.name,
	  			twitter_handle: follower.screen_name,
	  			location: follower.location,
	  			twitter_id: follower.id,
					)
			end
		end
	end

	def self.populate_follower_tweets user
		user.followers.each do |follower|
			Twitter.user_timeline.each do |tweet|
				user.follower_tweets.create!(
					text: tweet.text,
					tweet_id: tweet.id,
					user_id: user.id,
					datetime_tweeted: tweet.created_at
					)
			end
		end
	end


end