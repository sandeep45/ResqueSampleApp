require "resque/tasks"

task "resque:setup" => :environment do
  ENV['QUEUE'] = '*'
  Resque.before_fork do
    puts "in resque.rake before fork"
    defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!
  end

  Resque.after_fork do
    puts "in resque.rake after fork"
    defined?(ActiveRecord::Base) and
      ActiveRecord::Base.establish_connection
  end
end

desc "Alias for resque:work (To run workers on Heroku)"
task "jobs:work" => "resque:work"