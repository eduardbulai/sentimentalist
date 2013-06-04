# 	As a returning user
# 	I want to sign in
# 	so I can use the app
# 	- When a returning user arrives at the index page, they see a "sign in” button
# 	- When a returning user clicks on the sign in” button, they are taken through to their
# homepage

describe "user signs in" do
	it "user sees sign in button on welcome page" do
		visit root_url
		expect(page).to have_content("Sign In with Twitter")
	end

	it "user clicks sign in button and is redirected to dashboard" do
		visit root_url
		click_link("Sign In with Twitter")
		assert_redirected_to(dashboard_path)
	end
end