require 'spec_helper'

describe Api do

  let!(:users) { FactoryGirl.create_list(:user, 5, :with_emotions) }

  describe "#aggregate_emotion" do

    it "calculates the aggregate_emotion of all users in the db" do
      expect(Api.aggregate_emotion).to eql("disgust")
    end

  end

  describe "#aggregate_polarity" do

    it "calculates the aggregate_polarity of all the users in the db" do
      expect(Api.aggregate_polarity).to eql(4)
    end

  end

end
