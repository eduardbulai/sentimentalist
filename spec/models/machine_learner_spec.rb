require "spec_helper"

describe MachineLearner do

	let(:machine_learner) { FactoryGirl.create(:machine_learner) }
  let(:emotions) { [:anger, :joy, :fear, :sadness, :disgust, :surprise, :ambiguous] }

  context "associations" do

    it { should belong_to(:user) }

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

    describe "#build_classifier" do

      it "description" do
        new_classifier = machine_learner.build_classifier

        expect(new_classifier.instance_variable_get(:@wcount)).to eql({"joi"=>{:joy=>1},
          "anger"=>{:anger=>1}, "fear"=>{:fear=>1}, "uncertain"=>{:uncertain=>1},
          "disgust"=>{:disgust=>1}, "surpris"=>{:surprise=>1}, "sad"=>{:sadness=>1}})
        expect(new_classifier.instance_variable_get(:@ccount)).to eql({:anger=>1,
          :joy=>1, :fear=>1, :sadness=>1, :disgust=>1, :surprise=>1, :ambiguous=>0, :uncertain=>1})
        expect(new_classifier.instance_variable_get(:@ignore_words)).to eql(machine_learner.ignore_words)
        expect(new_classifier.instance_variable_get(:@stemming)).to eql(machine_learner.stemming)
      end

    end

    describe "#persist_machine_learner" do

      it 'persists machine learner' do
        initial_wcount = machine_learner.wcount.length
        initial_ccount = machine_learner.ccount[:joy]
        new_classifier = machine_learner.build_classifier
        new_classifier.train(:joy, "I love stuff!")
        machine_learner.persist_machine_learner(new_classifier)

        final_wcount = machine_learner.wcount.length
        final_ccount = machine_learner.ccount[:joy]

        expect(final_wcount).to be > (initial_wcount+1)
        expect(final_ccount).to be > (initial_ccount+1)
      end

    end

  end

end
