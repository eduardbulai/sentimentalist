require "spec_helper"

describe SignInHelper do

  describe "#perform", type: :feature do

    let!(:user) { FactoryGirl.create(:user_with_followers_and_machine_learner) }

    before do
      ResqueSpec.reset!
      sign_in(user)
    end

    it "adds user tweet update task to the queue" do
      Resque.enqueue(SignInHelper, user.id)
      SignInHelper.should have_queued(user.id).in(:users_queue)
    end

  end

end