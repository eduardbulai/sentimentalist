require 'spec_helper'


# As a potential user
# 	I want to create an account
# 	so I can use the app

# Acceptance criteria
# - When a potential user arrives at the welcome page, they see a “log in/sign up” button

# - If the potential user clicks on the “log in/sign up” button, they are taken through to the welcome page

describe "user creates account" do
	it "user is redirected to dashboard after clicking the log-on-with-facebook button" do
		visit root_path
		expect(page).to have_content("Log In with Facebook")
		click_button("Log In with Facebook")
		assert_redirected_to("????????")
	end
end