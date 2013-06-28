class BayesianClassificationUpdater

  @queue = :bayesian_classification_update_queue

  def self.perform(user_id)

    user = User.find_by_id(user_id)
    classify_tweets(user)

  end

  def self.classify_tweets(user)

    classify_user(user)
    classify_user_tweets(user)
    classify_followers(user)

  end


  def self.classify_user_tweets(user)

    tweets = user.user_tweets
    tweets.each do |tweet|
      tweet_text = tweet.text
      user_classifier = user.machine_learner.build_classifier
      tweet.bayesian_emotion = user_classifier.classify(tweet_text).to_s
    end

  end

  def self.classify_user(user)
    user.bayesian_emotion = EmotionGetter.get_bayesian_emotion(user,user)
  end

  def self.classify_followers(user)

    followers = user.followers
    followers.each do |follower|
      follower.bayesian_emotion = EmotionGetter.get_bayesian_emotion(user,follower)
    end

  end

end
