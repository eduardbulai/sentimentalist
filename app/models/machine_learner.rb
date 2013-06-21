class MachineLearner < ActiveRecord::Base
  attr_accessible :ccount, :ignore_words, :name, :stemming, :wcount, :user_id

  serialize :wcount, Hash
  serialize :ccount, Hash
  serialize :ignore_words, Array

  belongs_to :user, inverse_of: :machine_learner

  before_create do |machine_learner|
  	machine_learner.name = "joy or anger or fear or disgust or surprise or uncertain"
  	machine_learner.ignore_words = Stopwords.stopwords
  	machine_learner.stemming = true
  	machine_learner.wcount = {}
  	machine_learner.ccount = {}
  end

  def build_classifier
    new_classifier = StuffClassifier::Bayes.new(self.name)
    new_classifier.instance_variable_set(:@wcount, self.wcount)
    new_classifier.instance_variable_set(:@ccount, self.ccount)
    new_classifier.instance_variable_set(:@ignore_words, self.ignore_words)
    new_classifier.instance_variable_set(:@stemming, self.stemming)
    new_classifier
  end

  def persist_machine_learner new_classifier
    self.wcount = new_classifier.instance_variable_get(:@wcount)
    self.ccount = new_classifier.instance_variable_get(:@ccount)
    self.save
  end

end
