require 'spec_helper'

# 	As a returning user
# 	I want to sign in
# 	so I can use the app
# 	- When a returning user arrives at the index page, they see a "sign in” button
# 	- When a returning user clicks on the sign in” button, they are taken through to their
# homepage

describe "user signs in" do

	it "user sees sign in button on welcome page" do
		visit root_path
		expect(page).to have_content("Sign in with Twitter")
		click_link "Sign in with Twitter"
    expect(page).to have_content("Sign Out")
	end


end