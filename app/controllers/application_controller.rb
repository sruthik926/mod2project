class ApplicationController < ActionController::Base

  def cart
   session[:cart] ||= []
 end

 def add_flight_to_cart(flight_id)
   cart << flight_id
 end

 def find_the_flights
   @flights_in_cart = Flight.find(cart)
 end

end
