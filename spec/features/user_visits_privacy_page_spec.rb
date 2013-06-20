require 'spec_helper'


feature "user visits privacy page" do %q{

	As a user
	I want to view privacy information about the app
	So I can know what the implications of using the app are

	AC
	* user can visit the 'privacy' page from the welcome page
	* the about page contains information about the app's privacy policy
	* user can return to the welcome page from the 'privacy' page

}

	it "user arrives at privacy page from welcome page" do

		visit root_url
		expect(page).to have_content('Privacy')
		click_link('Privacy')
		expect(current_path).to eql(privacy_path)

	end

	it "the about page contains information about the app's privacy policy"

	it "user returns to welcome page from privacy page" do

		visit privacy_path
		expect(page).to have_content('Close')
		click_link('Close')
		expect(current_path).to eql(root_path)

	end

end