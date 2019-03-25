Rails.application.routes.draw do
  resources :reservations
  resources :reviews
  resources :flights
  resources :users, only: [:new, :create, :show, :edit, :update]

  get '/', to: "users#welcome", as: "welcome"
  get '/login', to: "users#login_display", as: "login_display"
  post '/login', to: "users#login", as: "submit"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
