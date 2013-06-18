require "spec_helper"

describe TweetUpdater do

  describe "#update_tweets" do
    before do
      ResqueSpec.reset!
    end

    before(:each) do
      @user = FactoryGirl.create(:user_with_followers_and_machine_learner)
    end

    it "adds user tweet update task to the queue" do
      Resque.enqueue(TweetUpdater, @user.id)
      TweetUpdater.should have_queued(@user.id).in(:tweet_update_queue)
    end

    it "removes user tweets older than one year from the database" do
      initial_oldest_user_tweet_datetime = @user.user_tweets.order("datetime_tweeted").first.id
      TweetUpdater.perform(@user.id)

      assertion = UserTweet.pluck(:id).include?(initial_oldest_user_tweet_datetime)
      expect(assertion).to be_false
    end

    it "removes user tweets older than one year from the database" do

      followers = @user.followers
      followers.each do |follower|
        begin
          oldest_follower_tweet_id = follower.follower_tweets.order("datetime_tweeted").first.id
          TweetUpdater.perform(@user.id)

          assertion = FollowerTweet.pluck(:id).include?(oldest_follower_tweet_id)
          expect(assertion).to be_false
        rescue
        end
      end

    end

  end

end