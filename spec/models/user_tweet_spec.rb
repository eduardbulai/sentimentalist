require 'spec_helper'

describe UserTweet do

  context "associations" do
  	it { should belong_to(:user) }
  end

end
