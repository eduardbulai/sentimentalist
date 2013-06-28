require 'spec_helper'

describe EmotionGetter do

  let!(:user) { FactoryGirl.create(:user_with_followers_and_machine_learner) }
  let(:possibilities) { %q{joy disgust anger ambiguous surprise sadness fear} }

  context " methods" do

    describe "#get_emotion" do

      it "creates an emotion for the user" do

        expect(user.emotion).to be_nil
        user.emotion = EmotionGetter.get_emotion(user)

        expect(possibilities).to include(user.emotion)

      end

    end

    describe "#get_polarity" do

      it "creates a polarity for the user" do

        expect(user.polarity).to be_nil
        user.polarity = EmotionGetter.get_polarity(user)

        expect((0..10)).to include(user.polarity)

      end

    end

    describe "#get_bayesian_emotion" do

      it "creates a bayesian_emotion for the user" do
        expect(user.bayesian_emotion).to be_nil
        user.bayesian_emotion = EmotionGetter.get_bayesian_emotion(user, user)

        expect(possibilities).to include(user.bayesian_emotion)
      end

    end

  end
end
