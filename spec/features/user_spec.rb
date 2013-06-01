require 'spec_helper'

describe User do

	describe "content on index page" do

		before(:each) do
			visit root_path
		end
		# user sees log in with facebook button on index page
		it "index page has a 'log in with facebook' button " do
			expect(page).to have_content("Log In with Facebook")
		end

		# user sees an 'about' link and a 'privacy' link on index page
		it "index page has an 'about' button" do
			expect(page).to have_content("About")
		end

		it "index page has a 'privacy' button" do
			expect(page).to have_content("Privacy")
		end
	end

	describe "content on home page" do
		# user sees icons representing their friends' emotional statuses on the home page
		it "user sees icons representing their friends' emotional statuses on the home page"

		# user sees a logout button
		it "home page contains a logout button"

		describe "home page sidebar" do
			# user sees sidebar containing filters for each of their friend groups
			it "sidebar features filters for all 'friend groups' imported from facebook"

			# user sees an "add new group" button at the bottom of the sidebar
			it "sidebar features an 'add new group' button"

			# user sees a "messages" icon on the sidebar
			it "sidebar features a 'messages button"

		end

		describe "home page navbar" do
			#user sees navbar featuring filters for 10 most recent status updates, 30 most recent, and 50 most recent
			it "navbar features filters for 3 different time frames"
		end

		# user sees an icon corresponding to their own emotional status
		it "home screen features an icon corresponding to the user's emotional status as of their 100 most recent status updates"

		# user sees a text box where they can post a status to facebook
		it "home screen features a text box from which users can post to facebook"

		# user sees an icon corresponding to "settings"
		it "home screen features a settings icon"

	end

	describe "index page functionality" do

		before(:each) do
			visit root_path
		end

		# when user clicks on the log in with facebook button, they are redirected to the home page
		it "'log in with facebook' button redirects user to home page" do
			click_button("Log In with Facebook")
			assert_redirected_to("?????????")
		end

		# when user clicks 'about' button they are redirected to a page containing information about the app
		it "about link redirects user to about page" do
			click_button("About")
			assert_redirected_to("??????????")
		end

		# when user clicks 'privacy' button they are redirected to a page containing information about privacy
		it "privacy button redirects user to privacy page" do
			click_button("Privacy")
			assert_redirected_to("?????????")
		end

		# If the potential user clicks on the “log in/sign up” button, they are taken through
		it "log-in-with-facebook button redirects user to home page" do
			click_button("Log In with Facebook")
			assert_redirected_to("???????????")
		end

		# While a user's session has not expired, they bypass the index page and are
		# taken directly to the home page
		it "A user in mid session bypasses the index page and continues on to the home page"

	end

	describe "home page functionality" do

		before (:each) do
			visit some_path
		end

		describe "sidebar functionality" do
			# When a user clicks on a group icon within the sidebar, the content of the central
			# dashboard on their homepage refreshes to display only the icons of the friends
			# contained within that specific group
			it "buttons on the sidebar filter the displayed icons by 'friend group'"

	    # When a user hovers over a group name in the left sidebar, a
			# dialog box appears giving them the option of either editing or
			# deleting the group
			it "hovering over a group name in the sidebar cues a modal giving the user the option to modify or delete the makeupof that group"

			it "clicking the 'delete' button removes the selected 'friend group' from the database "

			# When a user clicks on the 'modify' button, a large dialog box appears giving them an interface
			# to add or remove users to/from a group
			it "user clicks the 'edit' button and a modal appears"

			it "user can modify the makeup of their friend groups using the modal"

			# modal box contains 2 buttons: save and delete
			it "modal box contains 'save' and 'cancel' buttons"

			# a new 'friend group' is created when the user clicks the 'save' button
			it "a new 'friend group' is created when the user clicks the 'save' button"

			# the database remains unchanged if the user does clicks the 'cancel' button
			it "the database remains unchanged if the user does clicks the 'cancel' button"

			# the sidebar features a "messages" icon which cues a modal
			it "the messages modal appears when the user clicks the messages icon"

			# the messages modal features a scrolling view of all messages bewteen the 2 parties, and a text input field to reply
			it "the messages modal features a scrolling view of all messages bewteen the 2 parties, and a text input field to reply"
		end

		describe "navbar functionality" do
			# When a user clicks on a  filter tab, the friend icon field in the center of their
			# homepage refreshes to display only friends whose statuses have been updated within the
			# parameters of that filter
			it "when a user clicks on the 'Most recent' tab, the friend icon field in the center of their homepage refreshes to display only friends whose statuses have been updated within the parameters of that filter"

			it "when a user clicks on the 'Kinda recent' tab, the friend icon field in the center of their homepage refreshes to display only friends whose statuses have been updated within the parameters of that filter"

			it "when a user clicks on the 'Least recent' tab, the friend icon field in the center of their homepage refreshes to display only friends whose statuses have been updated within the parameters of that filter"
		end

		# When a user is on their homepage, they see a text field in which they can input text
		# Below the text field, there is a submit button that, if clicked, submits text written
		# in the text field to facebook as a status message
		it "user can update their facebook status via a text box on the home screen"

		# When a user clicks on the settings icon a modal is generated
		it "user generates a modal by clicking on the settings icon"

		# Settings modal consists of a list with all the user's information displayed
		it "settings modal displays the user's basic information"

		# Settings modal features "edit" icons next to each piece of information
		it "settings modal features 'edit' icons next to each piece of information"

		# Clicking on an 'edit' button will turn the associated field into an empty input field
		it "clicking 'edit' button generates an empty input field"

		describe "say hey functionality" do
			# clicking on a friend icon causes all others to fall away,
			# the selected one to slide over and become enlarged, and a
			# new modal to open up
			it "clicking on friend icon cues a modal"

			# the modal contains an enlarged version of the friend icon,
			# a scrolling view of that friend's 10 most recent status messages,
			# a box for inputting a private message, and a button through which
			# to "say hey" to that friend
			it "friend_focus modal contains enlarged version of friend icon"

			it "friend_focus modal contains a scrolling view of that friend's 10 most recent facebook statuses"

			it "friend_focus modal contains a text field through which a private message can be sent to that friend"

			it "friend_focus modal features a button using which a user 'says hey' to that friend"
		end

		describe "logging out" do
			# user ends session by clicking the logout button
			it "user ends session by clicking the logout button"

			# user is transported back to the index page by clicking the logout button
			it "user is transported back to the index page by clicking the logout button" do
				click_button("Logout")
				assert_redirected_to(root_path)
			end
		end

	end


	# When a user is on their homepage, they see a settings/logout dropdown menu
	# When a user clicks on the settings button a modal appears
	# The settings modal contains all basic information about the user
	# The user inputs new values via the settings modal
	# The user saves their modified account information by clicking a 'save' button on the
	# settings modal

	# When a user opens the settings/logout modal, they see a logout button
	# When a user clicks on the logout button, their session ends
	# When a user clicks on the logout button, they are redirected to the index page
end