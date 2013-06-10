require 'spec_helper'

# 	As a user
# 	I want to view my followers’ status-icons
# 	so I can find out how they are doing

# 	- When a user arrives on their homepage, they see a dashboard populated by icons
# displaying their followers’ emotional statuses

describe "user views default dashboard" do

  before do
    user = FactoryGirl.create(:user_with_followers)
    OmniAuth.config.add_mock( :twitter, {'uid' => '1234', 'provider' => 'twitter',
    'info' => {'name' => 'matt'},
    'credentials' => { 'token' => 'umad', 'secret' => 'bro?' }})
    visit dashboard_index_path
    binding
  end

  # let(:user) {FactoryGirl.create(:user_with_followers)}

  it "user sees a sidebar listing several time filters" do
  	expect(page).to have_content('Week')
  	expect(page).to have_content('Month')
  	expect(page).to have_content('Year')
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

  it "user sees a dashboard populated by icons displaying their followers emotional statuses" do
    followers = User.last.followers
    followers.each do |follower|
      expect(page).to have_content(follower.name)
      expect(page).to have_content(follower.emotion_week)
    end
  end

end