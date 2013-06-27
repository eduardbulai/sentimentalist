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

    	possibilities = %q{joy disgust anger ambiguous surprise sadness fear}

			output = follower.get_emotion

			expect(possibilities).to include(output)

    end

    it "calls polarity_for_timeframe" do

    	output = follower.get_polarity

    	expect(0..10).to include(output)

    end

  end

end
