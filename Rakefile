#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'resque/tasks'
require 'resque/plugins/heroku/tasks'

task "resque:setup" do
  ENV['QUEUE'] = '*'
end

task "jobs:work" => "resque:work"

Sentimentalist::Application.load_tasks

task "resque:preload" => :environment
