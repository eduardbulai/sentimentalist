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

  let(:user) { FactoryGirl.create(:user_with_followers_and_machine_learner)}

  before do
    sign_in(user)
  end

  it "user has a profile icon corresponding to the emotion reflected in their tweets for the week"

  it "user sees a sidebar listing several time filters" do

    within("#timeframes-filter") do
    	expect(page).to have_content('Week')
    	expect(page).to have_content('Month')
    	expect(page).to have_content('Year')
    end

  end


  it "user sees top navbar showing filters for 'Followers', 'Me' " do

    within("#user-followers-filter") do
    	expect(page).to have_content("Followers")
    	expect(page).to have_content("Me")
    end

  end


  it "user sees filter tabs for each emotion" do

    within("#emotions-filter") do
      expect(page).to have_content('Joy')
      expect(page).to have_content('Sadness')
      expect(page).to have_content('Anger')
      expect(page).to have_content('Surprise')
      expect(page).to have_content('Ambiguous')
      expect(page).to have_content('Disgust')
    end

  end


  it "user sees 'post to twitter' button on home dashboard" do

    expect(page).to have_selector('#post_to_twitter_modal')
    expect(page).to have_content('Post To Twitter')
    expect(page).to have_selector('form')

  end


  it "user sees a dashboard populated by icons displaying their followers emotional statuses" do

    expect(page).to have_selector('.iconfield')
    expect(page).to have_selector('.emot')

  end

end