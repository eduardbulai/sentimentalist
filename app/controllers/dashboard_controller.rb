class DashboardController < ApplicationController

  respond_to :json, :html

  def index
		@followers = current_user.followers
    @user_tweets = current_user.user_tweets

		respond_to do |format|
      format.html
      format.json { render json: {user: current_user, user_tweets: @user_tweets, followers: @followers} }
    end
  end

  #dp - extract to a resourceful route
  #POST to /tweets
  def post_to_twitter
    tweeter = current_user.tweeter
    tweeter.update(params[:tweet])
    redirect_to dashboard_index_path
  end

  #dp - extract to a resourceful route
  #DELETE to /account
  def delete_account
    user = User.find_by_id(current_user.id)
    user.delete
    redirect_to root_path
  end

  def load

    respond_to do |format|
      format.html
      format.json { render json: {user: current_user} }
    end

  end

  #dp - extract to a resourceful route
  def update_machine_learner
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

  def update_profile_icon
    user = current_user
    current_user.bayesian_emotion = user.get_bayesian_emotion(current_user,current_user)
    render json: { user: user }
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
      machine_learner.build_classifier
    end

    def trained_classifier(classifier, tweet_text, new_emotion)
      classifier.train(new_emotion.to_sym, tweet_text)
      classifier
    end

    def persist_classifier(classifier)
      machine_learner = current_user.machine_learner
      machine_learner.persist_machine_learner(classifier)
    end

end
