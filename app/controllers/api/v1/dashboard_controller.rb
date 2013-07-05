module Api
  module V1
    class DashboardController < ApplicationController
      def index
        @emotions = User.emotions_for_api
        respond_to do |format|
          format.json {render json: @emotions}
        end
      end
    end
  end
end
