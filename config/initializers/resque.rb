require 'resque_scheduler'

# configure redis connection
Resque.redis = $redis

# configure the schedule
Resque.schedule = YAML.load_file("#{Rails.root}/config/resque_schedule.yml")
