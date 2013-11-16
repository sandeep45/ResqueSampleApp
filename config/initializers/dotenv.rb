if Rails.env.development?
  puts "we ar in development, lets load dotenv"
  require 'dotenv'
  Dotenv.load
end