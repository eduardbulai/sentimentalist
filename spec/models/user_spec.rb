require 'spec_helper'

describe User do

	before do
		@user = FactoryGirl.create(:user_with_followers_and_machine_learner)
	end

	it 'has a machine learner' do
		expect(@user.machine_learner.user_id).to eql(@user.id)
	end

	it 'has followers' do
		expect(@user.followers).to_not be_empty
	end

	it 'has user tweets' do
		expect(@user.user_tweets).to_not be_empty
	end

	it 'has follower tweets' do
		@user.followers.each do |follower|
			expect(follower.follower_tweets).to_not be_empty
		end
	end

end
