require 'spec_helper'


feature "user visits about page" do %q{

	As a user
	I want to view about information about the app
	So I can get a sense of what the app is all about

	AC
	* user can visit the about page from the welcome page
	* the about page contains information about the app
	* user can return to the welcome page from the about page

}

	it "user can visit the about page from the welcome page" do
		visit root_url
		expect(page).to have_content('About')
		click_link('About')
		expect(current_path).to eql(about_path)
	end

	it "the about page contains information about the app"

	it "user can return to the welcome page from the about page" do
		visit privacy_path
		expect(page).to have_content('Close')
		click_link('Close')
		expect(current_path).to eql(root_path)
	end

end