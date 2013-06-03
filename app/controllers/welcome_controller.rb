class WelcomeController < ApplicationController

	def index
    @events = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end

	end

end
