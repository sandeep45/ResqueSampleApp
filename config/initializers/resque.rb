puts "SANDEEP in resque.rb using resque url #{ENV["REDISTOGO_URL"]}"

uri = URI.parse(ENV["REDISTOGO_URL"])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password, :thread_safe => true)

Dir["/app/app/jobs/*.rb"].each { |file| require file }

# This will make the tabs show up.
require 'resque_scheduler'
require 'resque_scheduler/server'