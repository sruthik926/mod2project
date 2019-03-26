class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :flight
  has_many :reviews
  accepts_nested_attributes_for :reviews
end
