require 'spec_helper'

describe FollowerTweet do

  context "associations" do

  	it { should belong_to(:follower) }

  end

  context "validations" do

    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:follower_id) }
    it { should validate_presence_of(:tweet_id) }

  end

end
