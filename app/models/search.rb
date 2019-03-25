class Search < ApplicationRecord
  def flights
    @flights ||= find_flights
  end

private

  def find_flights
    flights = Flight.order(:id)
    flights = flights.where("state like ?", "%#{origin}%") if origin.present?
    flights = flights.where("destination_state like ?", "%#{destination}%") if destination.present?
    flights = flights.where("date like ?", departure_date.to_s) if departure_date.present?
    flights = flights.where("return_date like ?", return_date.to_s) if return_date.present?
    flights
  end

end
