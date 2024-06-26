Rails.application.routes.draw do
  devise_for :users
  root "pages#home"
   resources :gears do
    resources :bookings, only: [:create]
   end

   resources :bookings, only: [:index, :destroy]
   get 'my_bookings', to: 'bookings#index', as: 'my_bookings'
   get 'my_gear', to: 'gears#my_gear', as: 'my_gears'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
end
