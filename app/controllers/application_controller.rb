class ApplicationController < ActionController::Base

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  #idiomatically, helper methods are declared on the top of the controller
  # also I think you would want this as protected so that inheriting controllers can access it
  helper_method :current_user

end
