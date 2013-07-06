require 'spec_helper'


feature 'user assesses their own tweets',
  authentication: true,
  vcr: {cassette_name: 'twitter/auth'} do %q{

    As a user
    I want to reset my bayesian classifier
    So I can train it better a second time

    AC
    * dashboard contains button for 'reset bayesian classifier'
    * clicking that button initiates a modal that prompts the user with "are you sure?"
    * submitting a positive response within the modal re-initializes the user's machine learner

  }

  let(:user) { FactoryGirl.create(:user_with_followers_and_machine_learner) }

  before do
    sign_in(user)
    visit dashboard_index_path
  end

  describe "dashboard contents" do

    it "page contains button for 'reset bayesian classifier'"
  end

  describe "user resets bayesian classifier" do

    it "user initiates modal"

    it "user resets bayesian classifier"

  end

end
