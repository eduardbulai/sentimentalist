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
    flash[:alert] = "Your Tweet has been Posted"
    redirect_to dashboard_index_path
  end

  def delete_account
    user = User.find_by_id(current_user.id)
    user.delete
    redirect_to root_path
  end

  def load

  end

  def update_machine_learner
    emotion = params[:emotion]
    new_emotion = emotion.downcase
    tweet = UserTweet.find(params[:id])
    # #need helper method to clean tweet
    tweet_message = tweet.text.gsub(/[^a-z ]/i, '').downcase
    tweet_message.gsub!(/(?=\w*h)(?=\w*t)(?=\w*t)(?=\w*p)\w*/, '')
    tweet_message.gsub!(/\s\s+/,' ')
    tweet.emotion = new_emotion
    new_classifier = current_user.machine_learner.build_classifier
    new_classifier.train(new_emotion.to_sym, tweet_message)
    current_user.machine_learner.persist_machine_learner(new_classifier)
    if tweet.save
      render :json => [tweet]
    else
      render :json => [], :status => :unprocessable_entity
    end
  end

end
