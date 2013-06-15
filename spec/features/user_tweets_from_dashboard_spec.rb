require 'spec_helper'

# 	As a user
# 	I want to be able to tweet from my dashboard
# 	So that I can tell my friends how I feel

# 	- When a user is on their homepage, they see a text field in which they can input text
# - Below the text field, there is a submit button that, if clicked, submits text written in the text field to twitter and it appears on their twitter profile as a tweet


feature "user tweets from dashboard",
	  authentication: true,
	  vcr: {cassette_name: 'twitter/auth'} do

	  before(:each) do
	    @user = FactoryGirl.create(:user_with_followers)
	    stub_auth_response(@user, :twitter)
	    visit root_path
	    click_link 'Sign in with Twitter'
	  end

	  it "dashboard contains a button for tweets posts" do
	  	expect(page).to have_content("Post To Twitter")
	  end

	  it "user receieves a flash message after having tweeted" do
	  	click_link 'Post To Twitter'
	  	fill_in '[tweet]', :with => '...'
	  	click_button('Post Your Tweet')
	  	expect(page).to have_content('Your Tweet has been Posted')
	  end
end