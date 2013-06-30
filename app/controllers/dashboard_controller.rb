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

  def post_to_twitter
    tweeter = current_user.tweeter
    tweeter.update(params[:tweet])
    redirect_to dashboard_index_path
  end

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

  def update_machine_learner
    update_user_tweet
    get_classifier
    train_classifier
    persist_classifier
    if tweet.save
      render :json => [tweet]
    else
      render :json => [], :status => :unprocessable_entity
    end
  end

  def update_profile_icon
    current_user.bayesian_emotion = EmotionGetter.get_bayesian_emotion(current_user,current_user)
    user = current_user
    respond_to do |format|
      format.json { render json: { user: user } }
    end
  end


  private

    def set_tweet_emotion
      emotion = params[:emotion]
      tweet = UserTweet.find(params[:id])
      new_emotion = emotion.downcase
    end

    def update_user_tweet
      set_tweet_emotion
      tweet.clean_tweet
      tweet.update_emotions(new_emotion)
    end

    def get_classifier
      machine_learner = current_user.machine_learner
      new_classifier = machine_learner.build_classifier
    end

    def train_classifier
      new_classifier.train(new_emotion.to_sym, tweet_message)
    end

    def persist_classifier
      machine_learner.persist_machine_learner(new_classifier)
    end

end
