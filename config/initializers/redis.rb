# configatron.redis_url = {
#   :development => "redis://localhost:6379",
#   :staging => ENV['REDISTOGO_URL'],
#   :production => ENV['REDISTOGO_URL']
# }[Rails.env.to_sym]

# uri = URI.parse(configatron.redis_url)
# $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
# Resque.redis = $redis

require 'resque/server'
uri = URI.parse(ENV["REDISTOGO_URL"])
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
