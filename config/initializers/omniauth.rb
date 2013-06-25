OmniAuth.config.logger = Rails.logger

OmniAuth.config.full_host = "http://sheltered-wave-2437.herokuapp.com/"

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET']
end
