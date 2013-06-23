def sign_in(user)

  visit root_path
  stub_auth_response(user, :twitter)
  click_link 'Sign in with Twitter'

end

def assess_tweet(user, emotion)

  new_emotion = emotion.downcase
  tweets=user.user_tweets
  test_tweet=tweets.first
  emotion=emotion.to_s
  tweet_message = test_tweet.text.gsub(/[^a-z ]/i, '').downcase
  tweet_message.gsub!(/(?=\w*h)(?=\w*t)(?=\w*t)(?=\w*p)\w*/, '')
  tweet_message.gsub!(/\s\s+/,' ')
  test_tweet.emotion = new_emotion
  new_classifier = user.machine_learner.build_classifier
  new_classifier.train(emotion.to_sym, tweet_message)
  user.machine_learner.persist_machine_learner(new_classifier)

end
