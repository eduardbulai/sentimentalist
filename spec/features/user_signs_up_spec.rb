# 	As a potential user
# 	I want to create an account
# 	so I can use the app

# Acceptance criteria
# - When a potential user arrives at the index page, they see a “log in/sign up” button
# - If the potential user clicks on the “log in/sign up” button, they are taken through to the index page

describe "user signs up" do

	let(:unregistered_user) { FactoryGirl.build(:unregistered_user) }

	it "sees a sign in" do

		visit '/users/sign_up'
		expect(page).to have_content("Sign up")
		fill_in 'Email', :with => unregistered_user.email
		fill_in 'Password', :with => unregistered_user.password
		fill_in 'Password confirmation', :with => unregistered_user.password_confirmation
		click_button('Sign up')
		expect(current_url).to include(dashboard_index_path)
	end

end