require 'resque_scheduler'
require 'resque/tasks'

# configure redis connection
Resque.redis = $redis

# configure the schedule
Resque.schedule = YAML.load_file("#{Rails.root}/config/resque_schedule.yml")


task "resque:setup" => :environment do
  ENV['QUEUE'] = '*'
end

desc "Alias for resque:work (To run workers on Heroku)"
task "jobs:work" => "resque:work"
