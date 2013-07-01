class BayesianClassificationUpdater

  @queue = :bayesian_classification_update_queue

  def self.perform(user_id)

    user = User.find_by_id(user_id)
    classify_tweets(user)

  end

  def self.classify_tweets(user)

    followers = user.followers
    followers.each do |follower|
      follower.bayesian_emotion = follower.get_bayesian_emotion(user,follower)
    end

  end

end
