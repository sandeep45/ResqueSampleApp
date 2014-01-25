require 'csv'

class EatController < ApplicationController
  def food
    Resque.enqueue_in(5.seconds, Eat, params[:food])
    render :text => "Put  in fridge to eat later.\n"
  end

  def hw
    render :text => "Hello World", :status => 200
  end

  def export
    Resque.enqueue(CreateExportFile)
    render :text => "We have added your request to create the file. Thanks!"
  end
end
