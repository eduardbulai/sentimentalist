configatron.redis_url = {
  # :development => "localhost:6379",
  :staging => ENV['REDISTOGO_URL'],
  :production => ENV['REDISTOGO_URL']
}[Rails.env.to_sym]

uri = URI.parse(configatron.redis_url)
$redis = Redis.new(:host => uri.host.to_s, :port => uri.port.to_s, :password => uri.password.to_s)
Resque.redis = $redis

