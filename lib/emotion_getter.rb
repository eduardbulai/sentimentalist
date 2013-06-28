module EmotionGetter

  class << self

    def get_emotion(user)
    	concatonated_tweets = user.concatonate_tweets
    	SadPanda.emotion(concatonated_tweets)
    end

    def get_polarity(user)
    	concatonated_tweets = user.concatonate_tweets
    	SadPanda.polarity(concatonated_tweets)
    end

    def get_bayesian_emotion(user, follower)
      concatonated_tweets = follower.concatonate_tweets
      machine_learner = user.machine_learner
      user_classifier = machine_learner.build_classifier
      if concatonated_tweets == ""
        "ambiguous"
      else
        user_classifier.classify(concatonated_tweets).to_s
      end
    end
  end
end
