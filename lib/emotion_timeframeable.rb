module EmotionTimeframeable

  def emotion_for_timeframe(timeframe) # week, month, or year
  	concatonated_tweets = self.concatonate_tweets_since timeframe
  	SadPanda.emotion(concatonated_tweets)
  end

  def polarity_for_timeframe(timeframe) # week, month, or year
  	concatonated_tweets = self.concatonate_tweets_since timeframe
  	SadPanda.polarity(concatonated_tweets)
  end

end