class SessionsController < ApplicationController
	def create
	  auth = request.env["omniauth.auth"]
	  user = User.from_omniauth(env["omniauth.auth"])
	  session[:user_id] = user.id
	  redirect_to load_path
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url
	end

  def error
    flash[:error] = "Sign in with Twitter failed"
    redirect_to root_path
  end

end
