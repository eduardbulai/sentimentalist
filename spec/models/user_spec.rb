require 'spec_helper'

describe User do

	# before do
 #    ResqueSpec.reset!
 #  end

	it "user gets new user tweets upon creation"

	it "user tweets are refreshed every hour" do
		user = FactoryGirl.create(:user_with_followers)
		user_tweets = user.user_tweets
		initial_earliest_tweet = user_tweets.pluck(:datetime_tweeted).min
		Timecop.freeze(Time.now + 1.hour) do
			earliest_tweet_plus_hour = user_tweets.pluck(:datetime_tweeted).min
			expect(earliest_tweet_plus_hour).to be > initial_earliest_tweet
		end
	end

	it "follower tweets are refreshed every hour"

end
