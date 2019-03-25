class ReservationsController < ApplicationController
before_action :find_the_flights, only: :index
  def index

  end

  def update
    flight = Flight.find(params[:id])
    flash[:notice] = "#{params[:name]} has been saved."
    add_flight_to_cart(params[:id])
    redirect_to reservations_path
  end
end
