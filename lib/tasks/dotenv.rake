if Rails.env.development?
  require 'dotenv/tasks'
  task :mytask => :dotenv do
      # things that require .env
  end
end
