# This file is used by Rack-based servers to start the application.

require 'resque/server'
run Rack::URLMap.new \
  "/"       => Sentimentalist::Application,
  "/resque" => Resque::Server.new
