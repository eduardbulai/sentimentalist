configatron.redis_url = {
  :development => "localhost:6379",
  :test => "localhost:6379",
  :staging => ENV['REDISTOGO_URL'],
  :production => ENV['REDISTOGO_URL']
}

uri = URI.parse(configatron.redis_url)
$redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
Redis.current = $redis
