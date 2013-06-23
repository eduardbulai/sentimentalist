class MachineLearner < ActiveRecord::Base
  attr_accessible :ccount, :ignore_words, :name, :stemming, :wcount, :user_id

  serialize :wcount, Hash
  serialize :ccount, Hash
  serialize :ignore_words, Array

  belongs_to :user, inverse_of: :machine_learner

  validates_presence_of :name,
    :stemming,
    :ignore_words


  before_create do |machine_learner|
  	machine_learner.name = "joy or anger or fear or disgust or surprise or uncertain"
  	machine_learner.ignore_words = Stopwords.stopwords
  	machine_learner.stemming = true
  	machine_learner.wcount = {}
  	machine_learner.ccount = {anger: 0, joy: 0, fear: 0, sadness: 0, disgust: 0, surprise: 0, ambiguous: 0}
  end

  def build_classifier
    new_classifier = StuffClassifier::Bayes.new(self.name)
    new_classifier.instance_variable_set(:@wcount, self.wcount)
    new_classifier.instance_variable_set(:@ccount, self.ccount)
    new_classifier.instance_variable_set(:@ignore_words, self.ignore_words)
    new_classifier.instance_variable_set(:@stemming, self.stemming)
    new_classifier.instance_variable_set(:@trained, self.trained)
    new_classifier
  end

  def persist_machine_learner new_classifier
    self.wcount = new_classifier.instance_variable_get(:@wcount)
    self.ccount = new_classifier.instance_variable_get(:@ccount)
    if !self.trained
      self.trained = self.machine_learner_is_trained
    end
    self.save
  end

  def machine_learner_is_trained
    trained = true
    emotions = [:anger, :joy, :fear, :sadness, :disgust, :surprise, :ambiguous]
    emotions.each do |emotion|
      if self.ccount[emotion] < 15
        trained = false
      end
    end
    trained
  end

end
