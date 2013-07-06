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
  }

  let(:user){ FactoryGirl.create(:user_with_followers_and_machine_learner) }

  before do
    sign_in(user)
    visit dashboard_index_path
  end

  context "desktop" do

    it 'dashboard page has manage account link' do

      within("#desktop") do
        expect(page).to have_link('Manage Account')
      end

    end

  end

  context "mobile" do

    it 'dashboard page has manage account link' do

      within("#mobile") do
        expect(page).to have_link('Manage Account')
      end

    end

  end

  context "manage account modal" do

    it "manage account modal has a 'delete account' button" do

      within("#manage_account_modal") do
        expect(page).to have_link("Delete My Account")
      end

    end

  end

end
