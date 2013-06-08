require 'spec_helper'

# 	As a user
# 	I want to view my followers’ status-icons
# 	so I can find out how they are doing

# 	- When a user arrives on their homepage, they see a dashboard populated by icons
# displaying their followers’ emotional statuses

describe "user views default dashboard" do

  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
  	visit root_url
  	click_link('Sign in with Twitter')
  end

  it "user sees a sidebar listing several time filters" do
  	expect(page).to have_content('Week')
  	expect(page).to have_content('Month')
  	expect(page).to have_content('Year')
  end

  it "user sees top navbar showing filters for 'Followers', 'Me' " do
  	expect(page).to have_content("Followers")
  	expect(page).to have_content("Me")
  end

  it "user sees filter tabs showing 'Emotion', 'Time'" do
  	expect(page).to have_content('By Emotion')
  	expect(page).to have_content('By Time')
  end

  it "user sees a dashboard populated by icons displaying their followers emotional statuses" do
  	user = User.last
  	first_follower = user.followers.first
  	last_follower = user.followers.last
  	expect(page).to have_content(first_follower.name)
  	expect(page).to have_content(last_follower.name)
  	last_follower.follower_tweets.each do |tweet|
  		if tweet
  			expect(page).to have_content(tweet.emotion)
  		end
  	end
  	first_follower.follower_tweets.each do |tweet|
  		if tweet
  			expect(page).to have_content(tweet.emotion)
  		end
  	end
  end

end