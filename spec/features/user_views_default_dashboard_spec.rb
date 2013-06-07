require 'spec_helper'

# 	As a user
# 	I want to view my followers’ status-icons
# 	so I can find out how they are doing

# 	- When a user arrives on their homepage, they see a dashboard populated by icons
# displaying their followers’ emotional statuses

describe "user views default dashboard" do
  let(:user) { FactoryGirl.create(:user) }

  it "user sees a dashboard populated by icons displaying their followers emotional statuses"

  it "user sees a navbar listing several time filters" do
  	visit root_url
  	click_link('Sogn In with Twitter')
  	expect(page).to have_content('Week')
  	expect(page).to have_content('Month')
  	expect(page).to have_content('Year')
  end

end