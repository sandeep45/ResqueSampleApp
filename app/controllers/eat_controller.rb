class EatController < ApplicationController
  def food
    Resque.enqueue(Eat, params[:food])
    sleep 5
    render :text => "Put  in fridge to eat later."
  end

  def hw
    render :text => "Hello World", :status => 200
  end
end
