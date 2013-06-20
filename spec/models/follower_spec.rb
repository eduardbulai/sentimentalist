require 'spec_helper'

describe Follower do

	let!(:user) { FactoryGirl.create(:user_with_followers_and_machine_learner) }
	let(:follower) { user.followers.first }

  context "associations" do

  	it { should belong_to(:user) }
  	it { should have_many(:follower_tweets) }

  end

  context "validations" do

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:twitter_handle) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:twitter_id) }

  end

  context "instance methods" do

    it "calls emotion_for_timeframe" do

    	possibilities = %q{joy disgust anger uncertain surprise sadness fear}

    	 ['week', 'month', 'year'].each do |timeframe|
				output = follower.emotion_for_timeframe(timeframe)

				expect(possibilities).to include(output)
			end

    end

    it "calls polarity_for_timeframe" do

    	['week', 'month', 'year'].each do |timeframe|
    		output = follower.polarity_for_timeframe(timeframe)

    		expect(0..10).to include(output)
    	end

    end

  end

end
