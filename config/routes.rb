Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars, only: [:show, :index, :new, :create] do
    get :display, on: :collection
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index]
  delete 'bookings/:id', to: 'bookings#destroy'
  get '/cars/bookings/:id', to: 'bookings#show'
  post '/cars/bookings/:id', to: 'bookings#update'
  get '/mybookings', to: 'bookings#mybookings'

end
