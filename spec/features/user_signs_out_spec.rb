require 'spec_helper'


feature "user signs out",
	authentication: true,
  vcr: {cassette_name: 'twitter/auth'} do %q{

    As a user
    I want to log out
    So I can leave the app

    AC
    * dashboard page has sign out link
    * user is redirected to the sign in page after clicking the sign out link
  }

  let(:user){ FactoryGirl.create(:user_with_followers_and_machine_learner) }

  before do
  	sign_in(user)
  end

  it 'dashboard page has sign out link' do

	  expect(page).to have_link('Sign Out')

	end


  it 'user can sign out' do

    click_link 'Sign In'
  	click_link 'Sign Out'
  	expect(current_url).to eql(root_path)
    expect(page).to have_link('Sign in with Twitter')

  end

end