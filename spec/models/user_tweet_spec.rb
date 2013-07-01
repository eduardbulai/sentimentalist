require 'spec_helper'

describe UserTweet do

  let!(:user) { FactoryGirl.create(:user_with_followers_and_machine_learner) }

  context "associations" do

  	it { should belong_to(:user) }

  end

  context "validations" do

    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:tweet_id)}

  end

  context "instance methods" do

    describe "#clean_tweet" do

      it "removes urls and other gross stuff from tweet" do
        tweet = user.user_tweets.first
        tweet.text = "lobster hickory http://www.boston.com/business #Rails"

        tweet = tweet.clean_tweet

        expect(tweet).to eql("lobster hickory #rails")
      end

    end

    describe "#update_emotions" do

      it "changes the user_tweet's emotion and bayesian_emotion attributes" do
        tweet = user.user_tweets.first
        expect(tweet.emotion).to eql("joy")

        tweet.update_emotions("disgust")

        expect(tweet.emotion).to eql("disgust")
        expect(tweet.bayesian_emotion).to eql("disgust")
      end

    end

  end

end
