require 'spec_helper'


feature "user signs out",
	authentication: true,
  vcr: {cassette_name: 'twitter/auth'} do %q{

    As a user
    I want to log out
    So I can leave the app

    AC
    * dashboard page has sign out link
    * user is redirected to the sign in page after clicking the sign out link
  }

  let(:user){ FactoryGirl.create(:user_with_followers_and_machine_learner) }

  before do
  	sign_in(user)
    visit dashboard_index_path
  end

  context "desktop" do

    it 'dashboard page has sign out link' do

      within("#desktop") do
        expect(page).to have_link('Sign Out')
      end

  	end


    it 'user can sign out' do

      within("#desktop") do
      	click_link 'Sign Out'
      	expect(current_path).to eql(root_path)
      end

    end

  end

  context "mobile" do

    it 'dashboard page has sign out link' do

      within("#mobile") do
        expect(page).to have_link('Sign Out')
      end

    end


    it 'user can sign out' do

      within("#mobile") do
        click_link 'Sign Out'
        expect(current_path).to eql(root_path)
      end

    end

  end

end
