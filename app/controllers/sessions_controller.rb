class SessionsController < ApplicationController
	def create
	  auth = request.env["omniauth.auth"]
	  user = User.from_omniauth(env["omniauth.auth"])
	  session[:user_id] = user.id
	  Resque.enqueue(TweetUpdater, user.id)
    Resque.enqueue(BayesianClassificationUpdater, user.id)
	  # user.tweets_updated = false
	  redirect_to dashboard_index_path, :notice => "Signed in!"
	end

	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, :notice => "Signed out!"
	end

  def error
    flash[:error] = "Sign in with Twitter failed"
    redirect_to root_path
  end

end
