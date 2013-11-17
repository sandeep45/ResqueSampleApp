require 'resque/errors'

module CreateExportFile
  @queue = :exports

  def self.perform
    puts "Starting to do exports"
    @foods = Food.all
    result = CSV.generate do |csv|
      csv << ["id","name"]
      puts @foods.length
      @foods.each do |f|
        csv << [f.id, f.name]
        puts "csv #{csv}"
      end
    end
    sleep 2
    puts "result #{result}"
  rescue Resque::TermException
    puts "an error happened. job asked to terminate while doing work"
    Resque.enqueue(CreateExportFile)
  end
end