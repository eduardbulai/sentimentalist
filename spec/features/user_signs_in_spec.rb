require 'spec_helper'

# 	As a returning user
# 	I want to sign in
# 	so I can use the app
# 	- When a returning user arrives at the index page, they see a "sign in” button
# 	- When a returning user clicks on the sign in” button, they are taken through to their
# homepage

describe "user signs in" do

	let!(:user) { FactoryGirl.create(:user) }

	it "user sees sign in button on welcome page" do
		visit root_url
		expect(page).to have_content("Sign In with Twitter")
	end

	it "unregistered user clicks sign in button and is redirected to sign in" do
		visit root_url
		click_link("Sign In with Twitter")
		expect(current_path).to eql('/users/sign_in')
	end

	it "unregistered user can sign in by inputing their information"

	it "registered user clicks sign in button and is redirected to sign in" do
		visit root_url
		click_link("Sign In with Twitter")
		fill_in 'Email', :with => user.email
		fill_in 'Password', :with => user.password
		click_button('Sign in')
		expect(current_path).to include(dashboard_index_path)
	end
end