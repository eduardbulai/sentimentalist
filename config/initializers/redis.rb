# configatron.redis_url = {
#   :test => "localhost:6379",
#   :staging => ENV['REDISTOGO_URL'],
#   :production => ENV['REDISTOGO_URL']
# }[Rails.env.to_sym]

configatron.redis_url_host = {
  :test => "localhost",
  :staging => ENV['REDISTOGO_URL_HOST'],
  :production => ENV['REDISTOGO_URL_HOST']
}[Rails.env.to_sym]

configatron.redis_port = {
  :test => "6379",
  :staging => ENV['REDISTOGO_URL_PORT'],
  :production => ENV['REDISTOGO_URL_PORT']
}[Rails.env.to_sym]

configatron.redis_url_password = {
  :test => "",
  :staging => ENV['REDISTOGO_URL_PASSWORD'],
  :production => ENV['REDISTOGO_URL_PASSWORD']
}[Rails.env.to_sym]

# uri = URI.parse(configatron.redis_url)
$redis = Redis.new(:host => configatron.redis_url_host, :port => configatron.redis_url_port,
  :password => configatron.redis_url_password)
Redis.current = $redis
