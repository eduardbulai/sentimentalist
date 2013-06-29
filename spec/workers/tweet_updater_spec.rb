require "spec_helper"

describe TweetUpdater,type: :feature do

  let!(:user){ FactoryGirl.create(:user_with_followers_and_machine_learner) }

  before do
    ResqueSpec.reset!
    sign_in(user)
  end

  describe "queueing" do

    it "adds user tweet update task to the queue" do

      Resque.enqueue(TweetUpdater, user.id)
      TweetUpdater.should have_queued(user.id).in(:tweet_update_queue)

    end

  end

end
