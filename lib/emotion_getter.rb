module EmotionGetter

  def get_emotion
  	concatonated_tweets = self.concatonate_tweets
  	SadPanda.emotion(concatonated_tweets)
  end

  def get_polarity
  	concatonated_tweets = self.concatonate_tweets
  	SadPanda.polarity(concatonated_tweets)
  end

  def get_bayesian_emotion
    concatonated_tweets = self.concatonate_tweets
    user_classifier = self.machine_learner.build_classifier
    user_classifier.classify(concatonated_tweets).to_s
  end

end
