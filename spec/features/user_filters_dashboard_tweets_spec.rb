require 'spec_helper'

# 	As a user
# 	I want to view sentiment information within different time frames
# So that I can see a historical visualization of how people are feeling

# - When a user arrives at the dashboard, they see tabs listing several time filters
# - When a user clicks on a time filter tab, the friend icon field in the center of their
# dashboard refreshes to display only friends whose statuses have been updated within that timeframe
# - Timeframes include ‘Today’, 7 Days’, 1 Month’, 1 Year’

describe "user filters dashboard" do

	context "user filters by emotion" do

		before do
	    OmniAuth.config.add_mock( :twitter, {uid: '1234', credentials: { 'token' => 'umad', 'secret' => 'bro?' }})
	    visit '/auth/twitter'
  	end

		it "user views tweets with emotion 'joy' " do
			click_button("Joy")

			expect(page).to_not have_selector(".emotion-anger")
			expect(page).to_not have_selector(".emotion-sadness")
			expect(page).to_not have_selector(".emotion-surprise")
			expect(page).to_not have_selector(".emotion-disgust")
			expect(page).to_not have_selector(".emotion-fear")
			expec(page).to_not have_selector(".emotion-other")

			expect_page.to have_selector(".joy")
		end

		it "user views tweets with emotion 'anger' " do
			click_button("Anger")

			expect(page).to_not have_selector(".emotion-joy")
			expect(page).to_not have_selector(".emotion-other")
			expect(page).to_not have_selector(".emotion-disgust")
			expect(page).to_not have_selector(".emotion-surprise")
			expect(page).to_not have_selector(".emotion-sadness")
			expect(page).to_not have_selector(".emotion-fear")

			expect(page).to have_selector(".emotion-anger")
		end

		it "user views tweets with emotion 'sadness' " do
			click_button("Sadness")

			expect(page).to_not have_selector(".emotion-joy")
			expect(page).to_not have_selector(".emotion-other")
			expect(page).to_not have_selector(".emotion-surprise")
			expect(page).to_not have_selector(".emotion-disgust")
			expect_page.to_not have_selector(".emotion-fear")
			expect_page.to_not have_selector(".emotion-anger")

			expect(page).to have_selector(".emotion-sadness")
		end

		it "user views tweets with emotion 'surprise' " do
			click_button("Surprise")

			expect(page).to_not have_selector(".emotion-sadness")
			expect(page).to_not have_selector(".emotion-fear")
			expect(page).to_not have_selector(".emotion-disgust")
			expect(page).to_not have_selector(".emotion-other")
			expect(page).to_not have_selector(".emotion-joy")
			expect(page).to_not have_selector(".emotion-anger")

			expect(page).to have_selector(".emotion-surprise")
		end

		it "user views tweets with emotion 'disgust' " do
			click_button("Disgust")

			expect(page).to_not have_selector(".emotion-joy")
			expect(page).to_not have_selector(".emotion-surprise")
			expect(page).to_not have_selector(".emotion-other")
			expect(page).to_not have_selector(".emotion-anger")
			expect(page).to_not have_selector(".emotion-fear")
			expect(page).to_not have_selector(".emotion-sadness")

			expect(page).to have_selector(".emotion-disgust")
		end

		it "user views tweets with emotion 'fear' " do
			click_button("Fear")

			expect(page).to_not have_selector(".emotion-joy")
			expect(page).to_not have_selector(".emotion-sadness")
			expect(page).to_not have_selector(".emotion-other")
			expect(page).to_not have_selector(".emotion-anger")
			expect(page).to_not have_selector(".emotion-disgust")
			expect(page).to_not have_selector(".emotion-surprise")

			expect(page).to have_selector(".emotion-fear")
		end

		it "user views tweets with emotion 'other' " do
			click_button("Other")

			expect(page).to_not have_selector(".emotion-anger")
			expect(page).to_not have_selector(".emotion-surprise")
			expect(page).to_not have_selector(".emotion-joy")
			expect(page).to_not have_selector(".emotion-fear")
			expect(page).to_not have_selector(".emotion-sadness")
			expect(page).to_not have_selector(".emotion-disgust")

			expect(page).to have_selector(".emotion-other")
		end

	end

	context "user filters by timeframe" do

		it "user views tweets from last week" do
			click_button("Week")

			expect(page).to_not have_selector(".month")
			expect(page).to_not have_selector(".year")

			expect(page).to have_selector(".week")
		end

		it "user views tweets from last month" do
			click_button("Month")

			expect(page).to_not have_selector(".week")
			expect(page).to_not have_selector(".year")

			expect(page).to have_selector(".month")
		end

		it "user views tweets for the year" do
			click_button("Year")

			expect(page).to_not have_selector(".week")
			expect(page).to_not have_selector(".month")

			expect(page).to have_selector(".year")
		end

	end

end