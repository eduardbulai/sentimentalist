class TwitterApi < ActiveRecord::Base

	attr_accessible :user

	def self.get_twitter_stuff user
		self.populate_user_tweets user
		self.populate_followers user
		self.populate_follower_tweets user
		# populate_user_tweet_hashtags
		# populate_follower_tweet_hashtags
	end

	def self.populate_user_tweets user
		Twitter.user_timeline.each do |tweet|
			user.user_tweets.create!(
				text: tweet.text,
				tweet_id: tweet.id,
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
				user.followers.create!(
					name: follower.name,
	  			twitter_handle: follower.screen_name,
	  			twitter_id: follower.id,
					)
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