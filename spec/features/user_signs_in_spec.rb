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

	it "unregistered user clicks sign in button and is redirected to sign in" do
		visit root_url
		click_link("Sign In with Twitter")
		expect(current_path).to eql('/users/sign_in')
	end

	it "unregistered user can sign in by inputing their information"

	it "registered user clicks sign in button and is redirected to sign in" do
		visit root_url
		click_link("Sign In with Twitter")
		expect(current_path).to eql('/users/sign_in')
		fill_in 'Email', :with => 'user@example.com'
		fill_in 'Password', :with => 'example00'
		click_button('Sign in')
		expect(current_path).to eql(dashboard_path)
	end
end