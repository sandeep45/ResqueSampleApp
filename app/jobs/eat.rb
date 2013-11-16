module Eat
  @queue = :food

  def self.perform(food)
    puts "Starting to eat #{food}!"
    sleep 2
    Food.create(:name => food)
    puts "Finished eating eat #{food}!"
  end
end