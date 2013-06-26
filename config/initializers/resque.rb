require 'resque_scheduler'
require 'resque/plugins/heroku'

# configure redis connection
Resque.redis = $redis

# configure the schedule
Resque.schedule = YAML.load_file("#{Rails.root}/config/resque_schedule.yml")
