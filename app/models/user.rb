class User < ApplicationRecord
  has_many :reservations
  has_many :flights, through: :reservations

  validates :email, uniqueness: true
  validates :first_name,:last_name, :age, :email, :address_1, :city, :state, :zipcode, presence: true
  validates :phone, presence: true, length: {is: 10}

  has_secure_password

  def full_name
     self.first_name + " " + self.last_name
  end


end
