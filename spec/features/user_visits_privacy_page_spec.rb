	# As a user
	# I want to view ‘privacy’ information about the app
	# So I can know what the implications of using the app are

	# - The welcome page contains a link to a modal window with information about the app’s
 	#              privacy policy


describe "user visits privacy page" do

	it "user arrives at privacy page from welcome page" do
		visit root_url
		expect(page).to have_content('Privacy')
		click_link('Privacy')
		assert_redirected_to(privacy_path)
	end

	it "user returns to welcome page from privacy page" do
		visit privacy_path
		expect(page).to have_content('Close')
		click_button("Close")
		assert_redirected_to(root_url)
	end

end