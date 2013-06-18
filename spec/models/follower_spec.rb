require 'spec_helper'

describe Follower do

  context "associations" do

  	it { should belong_to(:user) }
  	it { should have_many(:follower_tweets) }

  end

  context "validations" do

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:twitter_handle) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:twitter_id) }
    it { should validate_presence_of(:emotion_week) }
    it { should validate_presence_of(:emotion_month) }
    it { should validate_presence_of(:emotion_year) }
    it { should validate_presence_of(:polarity_week) }
    it { should validate_presence_of(:polarity_month) }
    it { should validate_presence_of(:polarity_year) }

  end

end
