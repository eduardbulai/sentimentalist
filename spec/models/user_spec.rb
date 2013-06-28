require 'spec_helper'

describe User do

	let!(:user) { FactoryGirl.create(:user_with_followers_and_machine_learner) }

	context "associations" do

	  it { should have_many(:followers) }
	  it { should have_many(:user_tweets) }
	  it { should have_one(:machine_learner) }

	end

	context "validations" do

	  it { should validate_presence_of(:name) }
	  it { should validate_presence_of(:twitter_handle) }
	  it { should validate_presence_of(:provider) }
	  it { should validate_presence_of(:uid) }
	  it { should validate_presence_of(:oauth_token) }
	  it { should validate_presence_of(:oauth_secret) }

	end

	context "initialization" do

		it 'has a machine learner' do
			expect(user.machine_learner.user_id).to eql(user.id)
		end

		it 'user has followers' do
			expect(user.followers).to_not be_empty
		end

		it 'user has user tweets' do
			expect(user.user_tweets).to_not be_empty
		end

		it 'followers initialize without follower tweets' do
			user.followers.each do |follower|
				expect(follower.follower_tweets).to_not be_nil
			end
		end

	end

	context "instance methods" do

		it 'calls get_tweet_polarity' do

			tweet = user.user_tweets.first

			output = user.get_tweet_polarity(tweet)

			expect(0..10).to include(output)

		end

		it "calls get_tweet_emotion" do

			tweet = user.user_tweets.first

			possibilities = %q{joy disgust anger ambiguous surprise sadness fear}

			output = user.get_tweet_emotion(tweet)

			expect(possibilities).to include(output)

		end

	end

end
