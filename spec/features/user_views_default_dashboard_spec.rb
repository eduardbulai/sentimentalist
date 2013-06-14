require 'spec_helper'

# 	As a user
# 	I want to view my followers’ status-icons
# 	so I can find out how they are doing

# 	- When a user arrives on their homepage, they see a dashboard populated by icons
# displaying their followers’ emotional statuses

describe "user views default dashboard",
  authentication: true,
  vcr: {cassette_name: 'twitter/auth'} do

  before do
    @user = FactoryGirl.create(:user_with_followers)
    stub_auth_response(@user, :twitter)
    visit root_path
    click_link 'Sign in with Twitter'
  end

  it "user sees a sidebar listing several time filters" do
  	expect(page).to have_content('Week')
  	expect(page).to have_content('Month')
  	expect(page).to have_content('Year')
    # end
  end

  it "user sees top navbar showing filters for 'Followers', 'Me' " do
  	expect(page).to have_content("Followers")
  	expect(page).to have_content("Me")
  end

  it "user sees filter tabs for each emotion" do
  	expect(page).to have_content('Joy')
  	expect(page).to have_content('Sadness')
    expect(page).to have_content('Anger')
    expect(page).to have_content('Surprise')
    expect(page).to have_content('Other')
    expect(page).to have_content('Disgust')
  end

  it "user sees 'post to twitter' button on home dashboard" do
    expect(page).to have_selector('#post_to_twitter_modal')
    expect(page).to have_content('Post To Twitter')
    expect(page).to have_selector('form')
  end

  it "user sees a dashboard populated by icons displaying their followers emotional statuses" do
    expect(page).to have_selector('#iconfield')
    expect(page).to have_selector('.emot')
  end

end