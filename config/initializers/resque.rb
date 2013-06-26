require 'resque_scheduler'
require 'resque/plugins/heroku'

# Dir["#{Rails.root}/app/workers/*.rb"].each { |file| require file }

# # configure redis connection
# Resque.redis = $redis

# # configure the schedule
# Resque.schedule = YAML.load_file("#{Rails.root}/config/resque_schedule.yml")

# Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }

Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }

ENV["REDISTOGO_URL"]
uri = URI.parse(ENV["REDISTOGO_URL"])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
