require 'resque/errors'

module Eat
  @queue = :food

  def self.perform(food)
    puts "Starting to eat #{food}!"
    (1..4).each do |i|
      puts "."*i
      sleep 1
    end
    Food.create(:name => food)
    puts "Finished eating eat #{food}!"
  rescue Resque::TermException
    puts "an error happened. job asked to terminate while doing work"
    Resque.enqueue(Eat, food)
  end
end