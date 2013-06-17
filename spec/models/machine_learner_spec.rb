require "spec_helper"

describe MachineLearner do

		let(:machine_learner) { FactoryGirl.create(:machine_learner) }

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

  it "ccount is an empty hash" do
  	expect(machine_learner.ccount).to eql({})
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
