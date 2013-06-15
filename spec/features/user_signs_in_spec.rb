require 'spec_helper'

# 	As a returning user
# 	I want to sign in
# 	so I can use the app
# 	- When a returning user arrives at the index page, they see a "sign in” button
# 	- When a returning user clicks on the sign in” button, they are taken through to their
# homepage

feature "user signs in",
  authentication: true,
  vcr: {cassette_name: 'twitter/auth'} do

		it "user sees sign in button on welcome page" do
			@user = FactoryGirl.create(:user_with_followers)
	    stub_auth_response(@user, :twitter)
	    visit root_path
	    click_link 'Sign in with Twitter'
	    expect(page).to have_content(@user.name)
		end

end