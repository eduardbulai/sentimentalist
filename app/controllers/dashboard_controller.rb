class DashboardController < ApplicationController
	def index

		@followers = current_user.followers

		respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_tweets }
    end

	end
end
