require 'resque_scheduler'

configatron.redis_url = {
  :development => "redis://localhost:6379",
  :staging => ENV['REDISTOGO_URL'],
  :production => ENV['REDISTOGO_URL']
}[Rails.env.to_sym]

uri = URI.parse(configatron.redis_url)
$redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
# Resque.redis = $redis

# configure redis connection
Resque.redis = $redis

# configure the schedule
Resque.schedule = YAML.load_file("#{Rails.root}/config/resque_schedule.yml")
