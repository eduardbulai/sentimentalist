require 'resque/tasks'
require 'resque_scheduler/tasks'

namespace :resque do
  task :setup do
    require 'resque'
    require 'resque_scheduler'
    require 'resque/scheduler'

    Resque.redis = $redis
    Resque.before_fork = Proc.new { ActiveRecord::Base.establish_connection }

  end
end

task "workers:work" => "resque:work"
