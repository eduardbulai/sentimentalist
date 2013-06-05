class SessionsController < ApplicationController
	def create
	  auth = request.env["omniauth.auth"]
	  user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
	  session[:user_id] = user.id
	  redirect_to dashboard_index_path, :notice => "Signed in!"
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Signed out!"
	end

	def show
    if session['823627243-UDZhCacE9mWVMbFprLKq90Rk2sD3iPYujpDXPV4I'] && session['eJKYJf3IKVRQDTlH59GXWnsrBohMHP49HRrNZA8HXo']
      @user = client.user(include_entities: true)
    else
      redirect_to failure_path
    end
  end

  def error
    flash[:error] = "Sign in with Twitter failed"
    redirect_to root_path
  end

end
