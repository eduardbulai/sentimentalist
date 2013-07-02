require 'spec_helper'

describe TwitterApi do

  let(:user) { FactoryGirl.create(:user) }

  context "before get_twitter_stuff is called" do

    it "initializes without a machine learner" do
      expect(user.machine_learner).to be_nil
    end

    it "initializes without user_tweets" do
      expect(user.user_tweets).to eql([])
    end

    it "initializes without followers" do
      expect(user.followers).to eql([])
    end

    it "user initializes without emotion" do
      expect(user.emotion).to be_nil
    end

    it "user initializes without bayesian_emotion" do
      expect(user.bayesian_emotion).to be_nil
    end

    it "user initializes without polarity" do
      expect(user.polarity).to be_nil
    end
  end

  context "after get_twitter_stuff is called",
    vcr: {cassette_name: 'twitter/user_twitter_stuff',  match_requests_on: [:method]} do

    before do
      TwitterApi.get_twitter_stuff(user)
    end

    it "user has a machine_learner" do
      expect(user.machine_learner).to_not be_nil
    end

    it "user has an emotion" do
      expect(user.emotion).to_not be_nil
    end

    it "user has a bayesian_emotion" do
      expect(user.bayesian_emotion).to_not be_nil
    end

    it "user has a polarity" do
      expect(user.polarity).to_not be_nil
    end

    it "user has user_tweets" do
      expect(user.user_tweets).to_not be_empty
    end

    it "user has followers" do
      expect(user.followers).to_not be_empty
    end

    it "user's followers have follower tweets" do
      user.followers.each do |follower|
        expect(follower.follower_tweets).to_not be_empty
      end
    end
  end
end
