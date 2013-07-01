require 'resque_scheduler'

# configure redis connection
Resque.redis = $redis
