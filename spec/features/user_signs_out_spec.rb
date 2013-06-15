require 'spec_helper'

	# As a user
	# I want to log out
	# So I can leave the app

	# - When a user clicks the logout button, their session ends
	# - When a user clicks the logout button, they are redirected to the welcome page

feature "user signs out",
	authentication: true,
  vcr: {cassette_name: 'twitter/auth'} do

  before do
  	user = FactoryGirl.create(:user_with_followers)
  	stub_auth_response(user, :twitter)
  	visit root_path
  	click_link 'Sign in with Twitter'
  end

  it 'dashboard page has sign out link' do
	  expect(page).to have_link('Sign Out')
	end

  it 'user can sign out' do
  	click_link 'Sign Out'
  	expect(current_url).to include(root_path)
  end
end