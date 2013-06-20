class MachineLearner < ActiveRecord::Base
  attr_accessible :ccount, :ignore_words, :name, :stemming, :wcount, :user_id

  serialize :wcount, Hash
  serialize :ccount, Hash

  belongs_to :user, inverse_of: :machine_learner

  before_create do |machine_learner|
  	machine_learner.name = "joy or anger or fear or disgust or surprise or uncertain"
  	machine_learner.ignore_words = Stopwords.stopwords
  	machine_learner.stemming = true
  	machine_learner.wcount = {}
  	machine_learner.ccount = {}
  end

end
