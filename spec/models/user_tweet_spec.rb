require 'spec_helper'

describe UserTweet do

  context "associations" do

  	it { should belong_to(:user) }

  end

  context "validations" do

    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:tweet_id)}

  end

end
