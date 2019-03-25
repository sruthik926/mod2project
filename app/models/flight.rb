class Flight < ApplicationRecord
  has_many :reviews
  has_many :reservations
  has_many :users, through: :reviews
  has_many :users, through: :reservations

  def self.search(name)
    if name
      flight = Flight.find_by(name: name)
      if flight
        self.where(name: name)
      else
        Flight.all
      end
    else
      Flight.all
    end
  end

end
