require "spec_helper"

# user is redirected to about page after clicking the about icon on the home page

describe "user is redirected to about page after clicking the about icon on the home page" do
	it "user sees 'about' button on welcome page" do
		visit root_path
		expect(page).to have_content("About")

		click_button('About')
		assert_redirected_to("????????")
	end
end