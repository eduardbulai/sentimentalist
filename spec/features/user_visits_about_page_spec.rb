	# As a user
	# I want to view ‘about’ information about the app
	# So I can get a sense of what the app is all about

	# - The welcome page contains a link to a modal window with information about the app

describe "user visits about page" do

	it "user arrives at about page from welcome page" do
		visit root_url
		expect(page).to have_content('About')
		click_link('About')
		expect(current_path).to eql(about_path)
	end

	it "user returns to welcome page from about page" do
		visit privacy_path
		expect(page).to have_content('Close')
		click_link('Close')
		expect(current_path).to include(root_path)
	end

end