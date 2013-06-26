# require 'resque/tasks'
# require 'resque_scheduler/tasks'

# namespace :resque do
#   task :setup do
#     require 'resque'
#     require 'resque_scheduler'
#     require 'resque/scheduler'

#     Resque.redis = $redis
#     Resque.schedule = YAML.load_file('config/resque_schedule.yml')
#     Resque.before_fork = Proc.new { ActiveRecord::Base.establish_connection }

#   end
# end

# task "workers:work" => "resque:work"

require 'resque/tasks'

task "resque:setup" => :environment do
  ENV['QUEUE'] = '*'
  Resque.before_fork = Proc.new { ActiveRecord::Base.establish_connection }
end

desc "Alias for resque:work (To run workers on Heroku)"
task "jobs:work" => "resque:work"
