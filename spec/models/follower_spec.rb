require 'spec_helper'

describe Follower do

	let!(:user) { FactoryGirl.create(:user_with_followers_and_machine_learner) }
	let(:follower) { user.followers.first }
  let(:follower_tweet) { FactoryGirl.build(:follower_tweet, follower_id: user.followers.first.id, id: 21) }
  let(:possibilities) { %q{joy disgust anger ambiguous surprise sadness fear} }

  context "associations" do

  	it { should belong_to(:user) }
  	it { should have_many(:follower_tweets) }

  end

  context "validations" do

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:twitter_handle) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:twitter_id) }

  end

  context "instance methods" do

    describe "#concatonate_tweets" do

      it "returns a non-empty string" do
        expect(follower.concatonate_tweets).to_not be_empty
      end

    end

    describe "#create_follower_tweet" do

      it "adds a follower_tweet to the database" do
        initial_count = FollowerTweet.count

        follower = user.followers.first

        follower.create_follower_tweet(follower_tweet)

        final_count = FollowerTweet.count

        expect(final_count).to eql(initial_count+1)
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

  end

end
