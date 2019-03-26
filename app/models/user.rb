class User < ApplicationRecord
  has_many :reservations
  has_many :flights, through: :reservations

  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :email, presence: true
  validates :address_1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  validates :phone, presence: true
  validates :phone, length: {is: 10}

  has_secure_password



  def full_name
     self.first_name + " " + self.last_name
  end


end
