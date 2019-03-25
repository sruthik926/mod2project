class User < ApplicationRecord
  has_many :reviews
  has_many :reservations
  has_many :flights, through: :reviews
  has_many :flights, through: :reservations
end
