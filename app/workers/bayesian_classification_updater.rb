class BayesianClassificationUpdater

  @queue = :bayesian_classification_update_queue

  def self.perform(user_id)

    user = User.find_by_id(user_id)
    classify_tweets(user)

  end

  def self.classify_tweets user

    classify_user_tweets user
    classify_followers user

  end


  def self.classify_user_tweets user

    tweets = user.user_tweets
    tweets.each do |tweet|
      user_classifier = user.machine_learner.build_classifier
      tweet.bayesian_emotion = user_classifier.classify(tweet).to_s
    end

  end

  def self.classify_followers user

    followers = user.followers
    followers.each do |follower|
      follower.bayesian_emotion = follower.bayesian_emotion
    end

  end

end
