require 'spec_helper'

# As a user
# I want to assess how Sentimentalist is assessing my own tweets
# So I can tune the language-processing algorithm better

feature 'user assesses own tweets',
	authentication: true,
  vcr: {cassette_name: 'twitter/auth'} do

  before do
  	@user = FactoryGirl.create(:user_with_followers)
  	stub_auth_response(@user, :twitter)
  	visit root_path
    click_link 'Sign in with Twitter'
  	click_link('Me')
  	@tweets = user.user_tweets
  end

  describe 'page contains emotion icons for each of the emotions in thier user_tweets' do

    it 'user sees iconfield containing emotion classifications for each of their tweets' do
			@tweets.each do |tweet|
				expect(page).to have_content(tweet.emotion)
			end
		end

  end

  describe "page contains buttons for tweet assessment" do

  end


	scenario 'user approves of original classification' do

	end

	scenario 'user chooses alternate classification' do

	end

end