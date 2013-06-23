class BayesianClassificationUpdater

  @queue = :bayesian_classification_update_queue

  def self.perform(user_id)

    user = User.find_by_id(user_id)
    classify_tweets(user)

  end

  def self.classify_tweets user

    classify_user_tweets user
    classify_follower_tweets user

  end


  def classify_user_tweets user

    tweets = user.user_tweets
    tweets.each do |tweet|
      user_classifier = user.machine_learner.build_classifier
      tweet.bayesian_emotion = user_classifier.classify(tweet).to_s
    end

  end

  def classify_followers user

    followers = user.followers
    followers.each do |follower|
      follower.bayesian_emotion_week = follower.bayesian_emotion_for_timeframe("week")
      follower.bayesian_emotion_month = follower.bayesian_emotion_for_timeframe("month")
      follower.bayesian_emotion_year = follower.bayesian_emotion_for_timeframe("year")
    end

  end

end
