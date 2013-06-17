class MachineLearner < ActiveRecord::Base
  attr_accessible :ccount, :ignore_words, :name, :stemming, :storage, :wcount
end
