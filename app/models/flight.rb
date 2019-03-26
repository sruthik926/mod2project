class Flight < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  validates :state, :destination_state, :date, :return_date, presence: true

  def self.find_flights(state, destination_state, date, return_date)
    flights = Flight.order(:id)
    flights = flights.where("state like ?", "%#{state}%")
    flights = flights.where("destination_state like ?", "%#{destination_state}%")

    flights = flights.where("date like ?", date)
    flights = flights.where("return_date like ?", return_date)
    flights
  end

end
