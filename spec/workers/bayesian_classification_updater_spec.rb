require "spec_helper"

describe BayesianClassificationUpdater, type: :feature do

  let!(:user){ FactoryGirl.create(:user_with_followers_and_machine_learner) }

  before do
    ResqueSpec.reset!
    sign_in(user)
  end

  describe "queueing" do

    it "adds user tweet update task to the queue" do
      Resque.enqueue(BayesianClassificationUpdater, user.id)
      BayesianClassificationUpdater.should have_queued(user.id).in(:bayesian_classification_update_queue)
    end

  end

  describe "#perform" do

    it "does not raise an error" do
      expect{BayesianClassificationUpdater.perform(user.id)}.to_not raise_error
    end

  end

end
