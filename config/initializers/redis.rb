configatron.redis_url = {
  :development => "localhost:6379",
  :test => "localhost:6379",
  :staging => ENV['REDISTOGO_URL'].split(":")[1],
  :production => ENV['REDISTOGO_URL'].split(":")[1]
}[Rails.env.to_sym]

uri = URI.parse(configatron.redis_url)
$redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
Redis.current = $redis
