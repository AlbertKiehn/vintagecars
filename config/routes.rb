Rails.application.routes.draw do
  devise_for :users
  root to: 'bookings#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars, only: [:show, :index, :new, :create]

  get '/bookings', to: 'bookings#index'
  get '/cars/bookings/new', to: 'bookings#new'
  post "bookings", to: "bookings#create"
  get '/cars/bookings/:id', to: 'bookings#show'
end
