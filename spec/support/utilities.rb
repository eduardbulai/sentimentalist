def sign_in(user)

  visit root_path
  stub_auth_response(user, :twitter)
  within("#desktop") do
    click_link 'Sign in with Twitter'
  end

end

def sign_out
  within("#desktop") do
    click_link('Sign Out')
  end
end

def assess_tweet(user, emotion)

  new_emotion = emotion.downcase
  tweets=user.user_tweets
  test_tweet=tweets.first
  emotion=emotion.to_s
  classify_tweet(test_tweet, new_emotion)

end

def classify_tweet(tweet, new_emotion)

  tweet.clean_tweet
  tweet.emotion = new_emotion
  new_classifier = user.machine_learner.classifier
  new_classifier.train(new_emotion.to_sym, tweet.text)
  user.machine_learner.persist_machine_learner(new_classifier)

end
