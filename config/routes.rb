Rails.application.routes.draw do
  resources :reservations, only:[:index, :show]
  resources :reviews, only:[:index, :new, :create, :show, :edit, :update]
  resources :flights, only: [:index, :show]
  resources :users, only: [:new, :create, :show, :edit, :update, :delete]
  resources :searches, only: [:show, :new, :create]

  get '/', to: "users#welcome", as: "welcome"

  get '/login/display', to: "users#login_display", as: "login_display"


  patch '/add_to_cart', to:"reservations#update", as: :add_flight_to_cart

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
