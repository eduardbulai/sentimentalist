class DashboardController < ApplicationController

  respond_to :json, :html

  def index

		@followers = current_user.followers
    @user_tweets = current_user.user_tweets

		respond_to do |format|
      format.html
      format.json { render json: @user_tweets }
    end

	end

  def post_to_twitter
      tweeter = current_user.tweeter
      tweeter.update(params[:tweet])
      flash[:alert] = "Your Tweet has been Posted"
      redirect_to dashboard_index_path
    end

    def update_machine_learner
      #params(emotion)
      emotion = params[:emotion]
      tweet = UserTweet.find(params[:id])
      tweet.emotion = emotion
      if tweet.save
        render :json => [tweet]
      else
        render :json => [], :status => :unprocessable_entity
      end
    end

end
