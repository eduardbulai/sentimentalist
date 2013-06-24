require 'spec_helper'


feature "user signs in",
  authentication: true,
  vcr: {cassette_name: 'twitter/auth'} do %q{

  	As a returning user
		I want to sign in
	 	so I can use the app

	 	AC
	 	* user sees sign in button on welcome page
	 	* user is redirected to the dashboard index upon successful signin
	 	* user sees a friendly message if an error occurs

  }

 	let(:user) { FactoryGirl.create(:user_with_followers_and_machine_learner) }

	it "user sees sign in button on welcome page" do

		visit root_path
		expect(page).to have_link("Sign in with Twitter")

	end


	it "user is redirected to the dashboard index upon successful sign-in" do

		sign_in(user)
		expect(current_path).to eql(dashboard_index_path)

	end

	it "user sees a friendly message if an error occurs"

end
