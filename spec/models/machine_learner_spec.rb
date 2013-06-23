require "spec_helper"

describe MachineLearner do

	let(:machine_learner) { FactoryGirl.create(:machine_learner) }
  let(:emotions) { [:anger, :joy, :fear, :sadness, :disgust, :surprise, :ambiguous] }

  context "associations" do

    it { should belong_to(:user) }

  end

  context "validations" do

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:stemming) }
    it { should validate_presence_of(:ignore_words) }

  end

  context "attributes" do

    it "has a name" do
    	expect(machine_learner.name).to eql('joy or anger or fear or disgust or surprise or uncertain')
  	end

    it "has ignore words" do
    	expect(machine_learner.ignore_words).to eql(Stopwords.stopwords)
    end

    it "stemming is set to true" do
    	expect(machine_learner.stemming).to eql(true)
    end

    it "wcount is an empty hash" do
    	expect(machine_learner.wcount).to eql({})
    end

    it "ccount is a non-empty hash" do
    	expect(machine_learner.ccount).to eql({anger: 0, joy: 0, fear: 0, sadness: 0, disgust: 0, surprise: 0, ambiguous: 0})
    end

    it "trained is set to nil" do
      expect(machine_learner.trained).to be_nil
    end

    it "can push items to wcount" do
    	machine_learner.wcount["bark"] = {dog: 1}
    	expect(machine_learner.wcount).to_not be_empty
    end

    it "can push items to ccount" do
    	machine_learner.ccount[:dog] = 1
    	expect(machine_learner.ccount).to_not be_empty
    end

  end

  context "methods" do

    describe "#machine_learner_is_trained" do

      it 'returns false if machine learner has not been trained' do
          expect(machine_learner.machine_learner_is_trained).to be_false
      end

      it 'returns true if machine learner has been trained' do

        expect(machine_learner.machine_learner_is_trained).to be_false

        emotions.each do |emotion|
          15.times do
            machine_learner.ccount[emotion]+=1
          end
        end

        expect(machine_learner.machine_learner_is_trained).to be_true

      end

    end

  end

end
