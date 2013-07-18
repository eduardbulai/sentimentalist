module DefaultAttributes

  def self.included(base)
    base.before_create :set_default_attributes
  end

  def set_default_attributes
    self.name = "joy or anger or fear or disgust or surprise or ambiguous"
    self.ignore_words = Stopwords.stopwords
    self.stemming = true
    self.wcount = {}
    self.ccount = {anger: 0, joy: 0, fear: 0, sadness: 0, disgust: 0, surprise: 0, ambiguous: 1}
  end


end
