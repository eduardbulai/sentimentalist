class MachineLearnersController < ApplicationController

  respond_to :json

  def update
    tweet = new_user_tweet
    classifier = new_classifier
    classifier = trained_classifier(classifier, tweet.text, tweet.emotion)
    persist_classifier(classifier)
    if tweet.save
      render :json => [tweet]
    else
      render :json => [], :status => :unprocessable_entity
    end
  end

  def reset
    delete_machine_learner
    machine_learner = current_user.build_machine_learner
    reset_user_tweets
    if machine_learner.save
      render :json => [machine_learner]
    else
      render :json => [], :status => :unprocessable_entity
    end
  end

  private

    def set_tweet_emotion
      emotion = params[:emotion]
      emotion.downcase
    end

    def new_user_tweet
      tweet = UserTweet.find(params[:id])
      tweet.text = tweet.clean_tweet
      tweet.update_emotions(set_tweet_emotion)
      tweet
    end

    def new_classifier
      machine_learner = current_user.machine_learner
      machine_learner.classifier
    end

    def trained_classifier(classifier, tweet_text, new_emotion)
      classifier.train(new_emotion.to_sym, tweet_text)
      classifier
    end

    def persist_classifier(classifier)
      machine_learner = current_user.machine_learner
      machine_learner.persist_machine_learner(classifier)
    end

    def delete_machine_learner
      machine_learner = current_user.machine_learner
      machine_learner.delete
    end

    def reset_user_tweets
      tweets = current_user.user_tweets
      tweets.each do |tweet|
        tweet.bayesian_emotion = 'ambiguous'
        tweet.emotion = current_user.get_tweet_emotion(tweet)
        tweet.save
      end
    end

end
