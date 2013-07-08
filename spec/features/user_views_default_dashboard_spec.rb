require 'spec_helper'


feature "user views default dashboard",
  authentication: true,
  vcr: {cassette_name: 'twitter/auth'} do %q{
    As a user
    I want to view my followers status-icons
    so I can find out how they are doing

    AC
    * user has a profile icon corresponding to the emotion reflected in their tweets for the week
    * user has a profile icon corresponding to the emotion reflected in their tweets for the week
    * user sees top navbar showing filters for 'Followers', 'Me'
    * user sees filter tabs for each emotion
    * user sees 'post to twitter' button on home dashboard
    * user sees a dashboard populated by icons displaying their followers emotional statuses
  }

  let(:user) { FactoryGirl.create(:user_with_followers_and_machine_learner, :with_emotions)}

  before do
    sign_in(user)
    visit dashboard_index_path
  end

  context "desktop" do

    it "user has a profile icon corresponding to the emotion reflected in their tweets for the week" do

      within("#desktop-profile-icon") do
        expect(page).to have_content("#{user.emotion}")
        expect(page).to have_content("#{user.bayesian_emotion}")
      end

    end

    it "user can change bayesian emotion by classifying their own tweets" do

      expect(user.bayesian_emotion).to eql('anger')
      expect(user.emotion).to eql('disgust')

      user_tweets = user.user_tweets
      user_tweets.each do |tweet|
        classify_tweet(tweet, 'surprise')
      end

      user.bayesian_emotion = user.get_bayesian_emotion(user, user)

      expect(user.bayesian_emotion).to eql('surprise')

    end

    it "user sees button for 'How It Works' " do

      within("#desktop") do
        expect(page).to have_content("How It Works")
      end

    end

    it "user sees filter tabs for 'Default Classifier', 'Bayesian Classifier' " do

      within("#desktop") do
        within("#bayesian-filter") do
          expect(page).to have_content("Default Classifier")
          expect(page).to have_content("Bayesian Classifier")
        end
      end

    end

    it "user sees filter tabs for 'Followers', 'Me' " do

      within("#desktop") do
        within("#user-followers-filter") do
          expect(page).to have_content("Followers")
          expect(page).to have_content("Me")
        end
      end

    end

     it "user sees filter tabs for each emotion" do

      within("#desktop") do
        within("#emotions-filter") do
          expect(page).to have_content('Joy')
          expect(page).to have_content('Sadness')
          expect(page).to have_content('Anger')
          expect(page).to have_content('Surprise')
          expect(page).to have_content('Ambiguous')
          expect(page).to have_content('Disgust')
        end
      end

    end

    it "user sees 'post to twitter' button on home dashboard" do

      within("#desktop") do
        expect(page).to have_content('Post To Twitter')
      end

    end

    it "user sees a 'sign out' button" do

      within("#desktop") do
        expect(page).to have_link("Sign Out")
      end

    end

    it "user sees a 'manage account' button" do

      within("#desktop") do
        expect(page).to have_link("Manage Account")
      end

    end

    it "user sees 'Bayesian Classifier' link" do

      within("#desktop") do
        expect(page).to have_link("Bayesian Classifier")
      end

    end


    it "user sees 'Default Classifier' link" do

      within("#desktop") do
        expect(page).to have_link("Default Classifier")
      end

    end

    it "user sees a dashboard populated by icons displaying their followers emotional statuses" do

      within("#desktop") do
        expect(page).to have_selector('.iconfield')
        expect(page).to have_selector('.emot')
      end

    end

  end

  context "mobile" do

    it "user has a profile icon corresponding to the emotion reflected in their tweets for the week" do

      within("#mobile-profile-icon") do
        expect(page).to have_content("#{user.emotion}")
        expect(page).to have_content("#{user.bayesian_emotion}")
      end

    end

    it "user can change bayesian emotion by classifying their own tweets" do

      expect(user.bayesian_emotion).to eql('anger')
      expect(user.emotion).to eql('disgust')

      user_tweets = user.user_tweets
      user_tweets.each do |tweet|
        classify_tweet(tweet, 'surprise')
      end

      user.bayesian_emotion = user.get_bayesian_emotion(user, user)

      expect(user.bayesian_emotion).to eql('surprise')

    end

    it "user sees button for 'How It Works' " do

      within("#mobile") do
        expect(page).to have_content("How It Works")
      end

    end

    it "user sees filter button for 'Classifier' " do

      within("#mobile") do
        expect(page).to have_link("Classifier")
      end

    end

    it "user sees button for 'Emotion' " do

      within("#mobile") do
        expect(page).to have_link("Emotion")
      end

    end

    it "user sees button for 'Context'" do

      within("#mobile") do
        expect(page).to have_link("Context")
      end

    end

    it "user sees a 'sign out' button" do

      within("#mobile") do
        expect(page).to have_link("Sign Out")
      end

    end

    it "user sees a 'manage account' button" do

      within("#mobile") do
        expect(page).to have_link("Manage Account")
      end

    end

    it "user sees 'post to twitter' button on home dashboard" do

      within("#mobile") do
        expect(page).to have_content('Post To Twitter')
      end

    end

    it "user sees a dashboard populated by icons displaying their followers emotional statuses" do

      within("#mobile") do
        expect(page).to have_selector('.iconfield')
        expect(page).to have_selector('.emot')
      end

    end

  end

  context "post_to_twitter_modal" do

    it "'post to twitter' modal is present on home dashboard" do

      expect(page).to have_selector('#post_to_twitter_modal')

    end

  end


end
