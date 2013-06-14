class DashboardController < ApplicationController
	def index

		@followers = current_user.followers

		respond_to do |format|
      format.html
      format.json { render json: @user_tweets }
    end

  def post_to_twitter
  	tweeter = current_user.tweeter
  	tweeter.update(params[:tweet])
  	flash[:alert] = "Your Tweet has been Posted"
  	redirect_to dashboard_index_path
  end

	end
end
