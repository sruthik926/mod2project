class ReservationsController < ApplicationController
before_action :find_the_flights, only: :index

  def index

  end

  def create

  end

  def update
    flight = Flight.find(params[:id])
    flash[:notice] = "#{params[:name]} has been saved."
    add_flight_to_cart(params[:id])
    redirect_to reservation_path(flight)
  end
end
