# This file is used by Rack-based servers to start the application.

require 'resque/server'
run Rack::URLMap.new \
"/" =&gt; Sentimentalist::Application,
"/resque" =&gt; Resque::Server.new
