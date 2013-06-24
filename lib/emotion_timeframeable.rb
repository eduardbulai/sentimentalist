module EmotionTimeframeable

  def emotion_for_timeframe(timeframe) # week, month, or year
  	concatonated_tweets = self.concatonate_tweets_since timeframe
  	SadPanda.emotion(concatonated_tweets)
  end

  def polarity_for_timeframe(timeframe) # week, month, or year
  	concatonated_tweets = self.concatonate_tweets_since timeframe
  	SadPanda.polarity(concatonated_tweets)
  end

  def bayesian_emotion_for_timeframe(timeframe) # week, month, or year
    concatonated_tweets = self.concatonate_tweets_since timeframe
    if concatonated_tweets == ""
      'uncertain'
    else
      user_classifier = self.machine_learner.build_classifier
      user_classifier.classify(concatonated_tweets).to_s
    end
  end

end
