require 'spec_helper'

describe User do

	before(:each) do
		@user = FactoryGirl.create(:user_with_followers)
	end

	it "user gets new user tweets upon creation"

	it "follower tweets are refreshed every hour"

end
