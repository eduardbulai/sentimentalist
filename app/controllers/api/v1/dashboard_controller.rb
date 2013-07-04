module Api
  module V1
    class DashboardController < ApplicationController
      def index
        # @user = current_user
        # @followers = current_user.followers
        # @user_tweets = current_user.user_tweets
        # render json: {user: @user, user_tweets: @user_tweets, followers: @followers}
        @users = User.all
        respond_to do |format|
          format.json {render json: @users}
        end
      end

      def load
        @user = current_user
        render json: {user: @user}
      end

      def update_profile_icon
        @user = current_user
        render json: { user: user }
      end
    end
  end
end
