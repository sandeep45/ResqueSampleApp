ENV["REDISTOGO_URL"] ||= "redis://redistogo:696ec37a0a985aa1f8b05aa05226dbe9@grideye.redistogo.com:9176/"

uri = URI.parse(ENV["REDISTOGO_URL"])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password, :thread_safe => true)

Dir["/app/app/jobs/*.rb"].each { |file| require file }