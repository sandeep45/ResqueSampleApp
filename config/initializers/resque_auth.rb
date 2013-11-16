# Resque::Server.use(Rack::Auth::Basic) do |user, password|
#   password == "secret"
# end

Resque::Server.use(Rack::Auth::Basic) do |user, password|
  password == "secret"
end