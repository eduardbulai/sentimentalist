require 'spec_helper'

	# As a user
	# I want to view ‘privacy’ information about the app
	# So I can know what the implications of using the app are

	# - The welcome page contains a link to a modal window with information about the app’s
 	#              privacy policy


feature "user visits privacy page" do

	it "user arrives at privacy page from welcome page" do
		visit root_url
		expect(page).to have_content('Privacy')
		click_link('Privacy')
		expect(current_path).to eql(privacy_path)
	end

	it "user returns to welcome page from privacy page" do
		visit privacy_path
		expect(page).to have_content('Close')
		click_link('Close')
		expect(current_path).to include(root_path)
	end

end