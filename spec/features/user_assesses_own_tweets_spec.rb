require 'spec_helper'


feature 'user assesses their own tweets',
	authentication: true,
  vcr: {cassette_name: 'twitter/auth'} do %q{

    As a user
    I want to assess how Sentimentalist is assessing my own tweets
    So I can tune the language-processing algorithm better

    AC
    * user sees iconfield containing emotion classifications for each of their tweets
    * page contains modal with tweet text
    * page contains modal with buttons corresponding to each possible emotion
    * user can execute an assessment that is reflected in the database and in the DOM
  }

  let(:user) { FactoryGirl.create(:user_with_followers_and_machine_learner) }
  let(:emotions) { [:anger, :joy, :fear, :sadness, :disgust, :surprise, :ambiguous] }

  before do
  	sign_in(user)
    visit dashboard_index_path
  	click_link('Me')
  	@tweets = user.user_tweets
    @test_tweet = @tweets.first
  end

  context 'page contains emotion icons for each of the emotions in their user_tweets' do

    it 'user sees iconfield containing emotion classifications for each of their tweets' do
      @tweets.each do |tweet|
        within("#icon#{tweet.id}") do
				  expect(page).to have_content(tweet.emotion)
        end
			end
		end

  end

  context "page contains buttons for tweet assessment" do

    it 'page contains modal with tweet text' do

      @tweets.each do |tweet|

        within("#evaluate_user_tweet_modal#{tweet.id}") do
          expect(page).to have_content(tweet.text)
        end

      end

    end

    it 'page contains modal with buttons corresponding to each possible emotion' do

      within("#evaluate_user_tweet_modal#{@test_tweet.id}") do
        expect(page).to have_selector("a")
        expect(page).to have_content("Joy")
        expect(page).to have_content("Surprise")
        expect(page).to have_content("Disgust")
        expect(page).to have_content("Fear")
        expect(page).to have_content("Anger")
        expect(page).to have_content("Ambiguous")
      end

    end

  end

	context 'user assesses tweet' do

    # it "user sees flash message" do

    #   click_link('Me')
    #   within(".hide#evaluate_user_tweet_modal#{@test_tweet.id}") do
    #     click_button("Surprise")
    #   end

    #   expect(page).to have_selector(".alert", text: "Sentiment Logged")

    # end

    it "user's assessment is recorded in the database" do

      initial_wcount = user.machine_learner.wcount
      intiial_ccount = user.machine_learner.ccount

      assess_tweet(user, "joy")
      assess_tweet(user, "anger")

      expect(user.machine_learner.wcount).to_not eql(initial_wcount)
      expect(user.machine_learner.ccount).to_not eql(intiial_ccount)

    end

	end

end
