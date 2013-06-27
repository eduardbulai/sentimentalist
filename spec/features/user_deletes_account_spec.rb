require 'spec_helper'


feature "user manages account",
  authentication: true,
  vcr: {cassette_name: 'twitter/auth'} do %q{

    As a user
    I want to delete my account
    So I can remove my information from the database

    AC
    * dashboard page has 'manage account' link
    * manage account modal has a 'delete account' button
    * user is redirected to the sign in page after clicking the delete account link
    * user is removed from the database after clicking the delete account link
  }

  let(:user){ FactoryGirl.create(:user_with_followers_and_machine_learner) }

  before do
    sign_in(user)
    visit dashboard_index_path
  end

  it 'dashboard page has manage account link' do

    expect(page).to have_link('Manage Account')

  end

  it "manage account modal has a 'delete account' button" do

    within("#manage_account_modal") do
      expect(page).to have_link("Delete My Account")
    end

  end


  it 'user can delete account' do

    expect(User.exists?(user.id)).to be_true

    click_link 'Manage Account'
    click_link("Delete My Account")

    expect(User.exists?(user.id)).to be_false
    expect(current_path).to eql(root_path)
    expect(page).to have_link('Sign in with Twitter')

  end

end
