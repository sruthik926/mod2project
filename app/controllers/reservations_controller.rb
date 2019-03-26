class ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations
  end

  def create
    @reservation = Reservation.create(flight_id: params[:flight_id], user_id: current_user.id)
      if @reservation.valid?
        redirect_to flight_path(@reservation.flight_id)
      else
        flash[:error] = @reservation.errors.full_messages
        redirect_to new_search_path
      end
  end

end
