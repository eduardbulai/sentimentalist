module EmotionGetter

  def emotion
  	concatonated_tweets = self.concatonate_tweets
  	SadPanda.emotion(concatonated_tweets)
  end

  def polarity
  	concatonated_tweets = self.concatonate_tweets
  	SadPanda.polarity(concatonated_tweets)
  end

  def bayesian_emotion
    concatonated_tweets = self.concatonate_tweets
    user_classifier = self.machine_learner.build_classifier
    user_classifier.classify(concatonated_tweets).to_s
  end

end
