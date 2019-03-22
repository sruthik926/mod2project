Rails.application.routes.draw do
  resources :reservations
  resources :reviews
  resources :flights
  resources :users, only: [:new, :create, :show, :edit, :update]

  get '/', to: "users#welcome", as: "welcome"
  get '/users/login', to: "users#login", as: "login"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
