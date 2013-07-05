module Api
  module V1
    class DashboardController < ApplicationController
      def index
        @users = User.all
        respond_to do |format|
          format.json {render json: @users, root: false}
        end
      end
    end
  end
end
