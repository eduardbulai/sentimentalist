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

  def load
    @user = current_user
    respond_to do |format|
      format.html
      format.json { render json: {user: @user} }
    end

  end

  def update_profile_icon
    @user = current_user
    current_user.bayesian_emotion = current_user.get_bayesian_emotion(@user,@user)
    render json: { user: @user }
  end

end
