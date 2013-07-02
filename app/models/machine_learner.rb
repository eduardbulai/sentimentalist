class MachineLearner < ActiveRecord::Base
  attr_accessible :ccount, :ignore_words, :name, :stemming, :wcount, :user_id

  serialize :wcount, Hash
  serialize :ccount, Hash
  serialize :ignore_words, Array

  belongs_to :user, inverse_of: :machine_learner


  #dp - use a protected method with a callback to encapsulate this
  # I might consider using an after_initialize
  #before_create :set_default_attributes
  before_create do |machine_learner|
  	machine_learner.name = "joy or anger or fear or disgust or surprise or ambiguous"
  	machine_learner.ignore_words = Stopwords.stopwords
  	machine_learner.stemming = true
  	machine_learner.wcount = {}
  	machine_learner.ccount = {anger: 0, joy: 0, fear: 0, sadness: 0, disgust: 0, surprise: 0, ambiguous: 1}
  end

  def build_classifier
    new_classifier = StuffClassifier::Bayes.new(self.name)
    set_classifier_instance_variables(new_classifier)
    new_classifier
  end

  #dp - if you're using instance variable get, you probably want to make this a publicly accessible method
  # so that it can be read from new_classifier
  def persist_machine_learner new_classifier
    self.wcount = new_classifier.instance_variable_get(:@wcount)
    self.ccount = new_classifier.instance_variable_get(:@ccount)
    self.save
  end

  private
    #dp - same here - you want to define a setter rather than relying on metaprogramming here
    def set_classifier_instance_variables(new_classifier)
      new_classifier.instance_variable_set(:@wcount, self.wcount)
      new_classifier.instance_variable_set(:@ccount, self.ccount)
      new_classifier.instance_variable_set(:@ignore_words, self.ignore_words)
      new_classifier.instance_variable_set(:@stemming, self.stemming)
      {joy: 'joy', anger: 'anger', fear: 'fear', ambiguous: 'ambiguous',
        disgust: 'disgust', surprise: 'surprise', sadness: 'sadness'}.each do |key, value|
          new_classifier.train(key, value)
      end
    end

end
