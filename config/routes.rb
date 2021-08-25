Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/bookings', to: 'bookings#index'
  get '/cars/bookings/new', to: 'bookings#new'
  post "bookings", to: "bookings#create"
  get '/cars/bookings/:id', to: 'bookings#show'
end
