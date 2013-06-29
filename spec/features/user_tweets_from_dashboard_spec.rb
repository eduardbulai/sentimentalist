require 'spec_helper'


feature "user tweets from dashboard",
	  authentication: true,
	  vcr: {cassette_name: 'twitter/auth'} do %q{

	  	As a user
			I want to be able to tweet from my dashboard
			So that I can tell my friends how I feel

			AC
			* home dashboard contains a button for posting tweets
			* user receieves a flash message after having tweeted

	  }

	  let(:user) { FactoryGirl.create(:user_with_followers_and_machine_learner) }

	  before do
	    sign_in(user)
	    visit dashboard_index_path
	  end

	  it "dashboard contains a button for tweets posts" do

	  	expect(page).to have_content("Post To Twitter")

	  end

	  it "post to twitter modal contains an interface for tweeting" do
	  	within("#post_to_twitter_modal") do
	  		expect(page).to have_content("Close")
	  	end
	  end

end
