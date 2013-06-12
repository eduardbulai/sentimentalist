require 'spec_helper'

# 	As a user
# 	I want to view sentiment information within different time frames
# So that I can see a historical visualization of how people are feeling

# - When a user arrives at the dashboard, they see tabs listing several time filters
# - When a user clicks on a time filter tab, the friend icon field in the center of their
# dashboard refreshes to display only friends whose statuses have been updated within that timeframe
# - Timeframes include ‘Today’, 7 Days’, 1 Month’, 1 Year’

## THIS NEEDS POLTERGEIST TO BE TESTED!!!

describe "user filters dashboard",
	authentication: true,
  vcr: {cassette_name: 'twitter/auth'} do

  before(:each) do
    @user = FactoryGirl.create(:user_with_followers)
    stub_auth_response(@user, :twitter)
    visit root_path
    click_link 'Sign in with Twitter'
  end

	context "user filters by emotion" do

		it "user views tweets with emotion 'joy' "

		it "user views tweets with emotion 'anger' "

		it "user views tweets with emotion 'sadness' "

		it "user views tweets with emotion 'surprise' "

		it "user views tweets with emotion 'disgust' "

		it "user views tweets with emotion 'fear' "

		it "user views tweets with emotion 'other' "

	end

	context "user filters by timeframe" do

		it "user views tweets from last week"

		it "user views tweets from last month"

		it "user views tweets for the year"

	end

end