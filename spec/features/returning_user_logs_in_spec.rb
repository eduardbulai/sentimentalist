require 'spec_helper'


# As a returning user
# 	I want to log in
# 	so I can use the app

# 	- When a returning user arrives at the index page, they see a “log in” button
# 	- When a returning user clicks on the “log in” button, they are taken through to their
# 		homepage



describe "user logs in" do

	before(:each) do
		visit root_path
	end

	it "user is redirected from the welcome page to the dashboard after clicking the log in button" do
		click_button("Log In with Facebook")
		assert_redirected_to("????????")
	end

	it "user's data is added to Users table and Authentications table" do
		initial_count_users = User.count
		initial_count_authentications = Authentication.count
		click_button("Log In with Facebook")

		expect(User.count).to be > initial_count_users
		expect(Authentication.count).to be > initial_count_authentications
	end
end
