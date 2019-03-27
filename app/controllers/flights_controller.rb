class FlightsController < ApplicationController

  def index
    @flights = Flight.find_flights(params[:flight][:state], params[:flight][:destination_state], params[:flight][:date],params[:flight][:return_date])
    render :index
  end

  def new_search
    @new_flight= Flight.new
    render :new
  end

  def show
    @flight = Flight.find(params[:id])
    render :show
  end

end
