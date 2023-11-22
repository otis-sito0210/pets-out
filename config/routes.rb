Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :cities do
    resources :places, only: [:new, :create, :index]
  end

  resources :trips, only: [:new, :create] do
    resources :activities, only: [:index]
  end

  resources :appointments
  resources :places, only: [:edit, :update]

  get "my_trips", to: "trips#my_trips_index", as: "my_trips"

  resources :pets
end
