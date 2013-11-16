module Eat
  @queue = :food

  def self.perform(food)
    puts "Starting to eat #{food}!"
    (1..10).each do |i|
      puts "."*i
      sleep 1
    end
    Food.create(:name => food)
    puts "Finished eating eat #{food}!"
  end
end