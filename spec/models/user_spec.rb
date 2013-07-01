require 'spec_helper'

describe User do

	let!(:user) { FactoryGirl.create(:user_with_followers_and_machine_learner) }
	let(:user_tweet) {FactoryGirl.build(:user_tweet, user_id: user.id, id: 21)}

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

		describe "#get_tweet_polarity" do

			it 'returns a number between 0 and 10' do

				tweet = user.user_tweets.first

				output = user.get_tweet_polarity(tweet)

				expect(0..10).to include(output)

			end

		end

		describe "#get_tweet_emotion" do

			it "returns an emotion" do

				tweet = user.user_tweets.first

				possibilities = %q{joy disgust anger ambiguous surprise sadness fear}

				output = user.get_tweet_emotion(tweet)

				expect(possibilities).to include(output)

			end

		end

		describe "#get_bayesian_emotion_of_tweet" do

			it "returns an emotion" do

				tweet = user.user_tweets.first

				possibilities = %q{joy disgust anger ambiguous surprise sadness fear}

				output = user.get_bayesian_emotion_of_tweet(tweet)

				expect(possibilities).to include(output)

			end

		end


		    describe "#get_stored_user_tweet_ids" do

      it "returns an array containing all user_tweet ids" do
        output = user.get_stored_user_tweet_ids

        user.user_tweets.each do |tweet|
          expect(output).to include(tweet.tweet_id)
        end
      end

    end

    describe "#get_stored_follower_ids" do

      it "returns an array containing all follower ids" do
        output = user.get_stored_follower_ids

        user.followers.each do |follower|
          expect(output).to include(follower.twitter_id)
        end
      end

    end

    describe "#get_stored_follower_tweet_ids" do

      it "returns an array containing all follower_tweet ids" do

        user.followers.each do |follower|

          output = follower.get_stored_follower_tweet_ids

          follower.follower_tweets.each do |tweet|
            expect(output).to include(tweet.tweet_id)
          end

        end

      end

    end

    describe "#create_user_tweet" do

      it "adds a user_tweet to the database" do
        initial_count = UserTweet.count

        user.create_user_tweet(user_tweet)

        final_count = UserTweet.count

        expect(final_count).to eql(initial_count+1)
      end

    end

	end

end
