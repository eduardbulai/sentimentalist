class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private

  def current_user
  	@current_user||User.find(session[:user_id]) if session[:user_id]
  end

  def client
	  Twitter.configure do |config|
		  config.consumer_key = 'KQvSsA1AFozcJpzQ3EV4w'
		  config.consumer_secret = '1nEZb8ibn1XSxemkeaxQXC8v3MKNqVceOh95XEBTyIE'
		  config.oauth_token = '823627243-UDZhCacE9mWVMbFprLKq90Rk2sD3iPYujpDXPV4I'
		  config.oauth_token_secret = 'eJKYJf3IKVRQDTlH59GXWnsrBohMHP49HRrNZA8HXo'
		end
  end

end