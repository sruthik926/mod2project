class ApplicationController < ActionController::Base


  def current_user
      User.find_by({ id: session[:user_id] })
  end

  def logged_in?
    !!current_user
  end

  def authorized
    redirect_to login_path unless logged_in?
  end

  def cart
   session[:cart] ||= []
  end

  def add_flight_to_cart(flight_id)
    byebug
   cart << flight_id
  end

  def find_the_flights
   @flights_in_cart = Flight.find(cart)
  end

end
