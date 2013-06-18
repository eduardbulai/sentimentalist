require 'spec_helper'

# As a user
# I want to assess how Sentimentalist is assessing my own tweets
# So I can tune the language-processing algorithm better

feature 'user assesses own tweets',
	authentication: true,
  vcr: {cassette_name: 'twitter/auth'} do

  before do
  	@user = FactoryGirl.create(:user_with_followers_and_machine_learner)
  	stub_auth_response(@user, :twitter)
  	visit root_path
    click_link 'Sign in with Twitter'
  	click_link('Me')
  	@tweets = @user.user_tweets
    @tweet_id = @tweets.first.id
  end

  describe 'page contains emotion icons for each of the emotions in thier user_tweets' do

    it 'user sees iconfield containing emotion classifications for each of their tweets' do
			@tweets.each do |tweet|
				expect(page).to have_content(tweet.emotion)
			end
		end

  end

  describe "page contains buttons for tweet assessment" do

    it 'page contains modal with tweet text' do

      @tweets.each do |tweet|

        expect(page).to have_content(tweet.text)

      end

    end

    it 'page contains modal with buttons corresponding to each possible emotion' do

      within("#evaluate_user_tweet_modal#{@tweet_id}") do
        expect(page).to have_selector("a[href='#']")
        expect(page).to have_content("Joy")
        expect(page).to have_content("Surprise")
        expect(page).to have_content("Disgust")
        expect(page).to have_content("Fear")
        expect(page).to have_content("Anger")
        expect(page).to have_content("Ambiguous")
      end

    end

  end


	describe 'user approves of original classification' do

    it "user's classification confirms SadPanda classification"

	end

	describe 'user chooses alternate classification' do

    it "user's classification contradicts SadPanda classification"

	end

end