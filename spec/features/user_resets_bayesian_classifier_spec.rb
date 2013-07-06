require 'spec_helper'


feature 'user assesses their own tweets',
  authentication: true,
  vcr: {cassette_name: 'twitter/auth'} do %q{

    As a user
    I want to reset my bayesian classifier
    So I can train it better a second time

    AC
    * dashboard contains button for 'reset bayesian classifier'
    * dashboard contains modal prompting the user to confirm their decision
    * modal contains link to reset bayesian classifier
  }

  let(:user) { FactoryGirl.create(:user_with_followers_and_machine_learner) }

  before do
    sign_in(user)
    visit dashboard_index_path
  end

  describe "page contains reset confirmation modal" do

    it "user initiates modal" do
      within("#reset_bayesian_classifier_modal") do
        expect(page).to have_content("Just Kidding")
        expect(page).to have_link("I'm Serious")
      end
    end

  end

  context "desktop" do

    describe "dashboard contents" do

      it "page contains button for 'reset bayesian classifier'" do
        within("#desktop") do
          expect(page).to have_content("Reset Bayesian Classifier")
        end
      end

    end

  end

  context "mobile" do

    describe "dashboard contents" do

      it "page contains button for 'reset bayesian classifier'" do
        within("#mobile") do
          expect(page).to have_content("Reset Bayesian Classifier")
        end
      end

    end

  end

end
