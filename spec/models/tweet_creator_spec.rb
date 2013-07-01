require 'spec_helper'


describe TweetCreator do

  let!(:user) { FactoryGirl.create(:user_with_followers_and_machine_learner) }

  context "instance methods" do

    describe "#object_in_database" do

      context "when object is in database" do

        it "returns true" do
          valid_user_tweet = user.user_tweets.first
          stored_ids = user.get_stored_user_tweet_ids
          stored_ids << valid_user_tweet.id
          output = user.object_in_database(stored_ids, valid_user_tweet)
          expect(output).to be_true
        end

      end

      context "when object is not in database" do

        it "returns false" do
          invalid_user_tweet = user.user_tweets.first
          stored_ids = user.get_stored_user_tweet_ids
          output = user.object_in_database(stored_ids, invalid_user_tweet)

          expect(output).to be_false
        end

      end
    end

  end

end
