class Search < ApplicationRecord
  validates :origin, :destination, :departure_date, :return_date, presence: true

  def flights
    @flights ||= find_flights
  end

private

  def find_flights
    flights = Flight.order(:id)
    flights = flights.where("state like ?", "%#{origin}%")
    flights = flights.where("destination_state like ?", "%#{destination}%")
    flights = flights.where("date like ?", departure_date.strftime("%Y-%m-%d"))
    flights = flights.where("return_date like ?", return_date.strftime("%Y-%m-%d"))
    flights
  end

end
