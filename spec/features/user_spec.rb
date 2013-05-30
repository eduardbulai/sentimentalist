require 'spec_helper'

describe User do
	# When a potential user arrives at the index page, they see a “log in/sign up” button
	# If the potential user clicks on the “log in/sign up” button, they are taken through
	# to the index page

	# When a returning user arrives at the index page, they see a “log in” button
	# When a returning user clicks on the “log in” button, they are taken through to their
	# homepage

	# When a user arrives on their homepage, they see a dashboard containing icons
	# showing their friends’ emotional statuses

	# When a user arrives at their homepage, they see a sidebar listing various groupings of
	# their Facebook friends
	# When a user clicks on a group icon within the sidebar, the content of the central
	# dashboard on their homepage refreshes to display only the icons of the friends
	# contained within that specific group

	# When a user right-clicks on a group name in the left sidebar, a dialog box appears giving
	# them the option of either editing or deleting the group
	# When a user clicks on the ‘edit’ button, a large dialog box appears giving them an interface
	# to add or remove users to/from a group
	# When a user clicks on the ‘delete’ button, the group is removed from the database

	# When a user arrives at their homepage, they see tabs listing several time filters
	# When a user clicks on a time filter tab, the friend icon field in the center of their
	# homepage refreshes to display only friends whose statuses have been updated within that
	# timeframe

	# When a user is on their homepage, they see a text field in which they can input text
	# Below the text field, there is a submit button that, if clicked, submits text written
	# in the text field to facebook as a status message

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