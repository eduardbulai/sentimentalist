class SessionsController < ApplicationController

	def create
	  auth = request.env["omniauth.auth"]
	  current_user_authentication = Authentication.find_by_provider_and_uid(auth["provider"], auth["uid"])
	  current_user_id = current_user_authentication.user_id
	  user = User.find_by_id(current_user_id) || User.create_with_omniauth(auth)
	  session[:user_id] = user.id
	  redirect_to root_url, :notice => "Signed in!"
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Signed out!"
	end

end
