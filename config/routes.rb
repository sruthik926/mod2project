Rails.application.routes.draw do
  resources :reservations, only:[:index, :show]
  resources :reviews
  resources :flights, only: [:index, :show]
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :searches, only: [:show, :new, :create]

  get '/', to: "users#welcome", as: "welcome"

  get '/login', to: "users#login_display", as: "login_display"
  post '/login', to: "users#login", as: "submit"

  patch '/add_to_cart', to:"reservations#update", as: :add_flight_to_cart



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
