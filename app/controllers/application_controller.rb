class ApplicationController < ActionController::Base
<<<<<<< HEAD

	private

  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

  def after_sign_up_path_for(resource)
  	dashboard_index_path
	end
=======
  protect_from_forgery

  helper_method :current_user

  private

  def current_user
  	@current_user||User.find(session[:user_id]) if session[:user_id]
  end
>>>>>>> resque

end