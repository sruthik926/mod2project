class FlightsController < ApplicationController
  before_action :find_the_flights, only: :index

  def index
    @flights = Flight.all
    render :index
  end

  def show
    @flight = Flight.find(params[:id])
    render :show
  end

  private
  def flights_params
    params.require(:flight).permit(:search)
  end

end
