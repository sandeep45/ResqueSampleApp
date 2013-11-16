class EatController < ApplicationController
  def food
    Resque.enqueue(Eat, params[:food])
    render :text => "Put  in fridge to eat later."
  end

  def hw
    render :text => "Hello World", :status => 200
  end
end
