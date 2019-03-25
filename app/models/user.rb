class User < ApplicationRecord


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





has_many :reviews
has_many :reservations
has_many :flights, through: :reviews
has_many :flights, through: :reservations

def full_name
     self.first_name + " " + self.last_name
end

 def password=(new_password)
   self.password_digest = dumb_hash(new_password)
 end

 def authenticate(password)
   return nil unless dumb_hash(password) == password_digest
   self
 end

 private

 def dumb_hash(input)
   input.bytes.reduce(:+)
 end



end
