Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :cities do
    resources :places, only: [:new, :create, :edit, :index]
    resources :activities, only: [:new, :create, :edit, :update]
  end

  resources :trips do
    resources :activities, only: [:index]
  end

  resources :places do
    resources :trips, only: [:new, :create]
  end

  resources :appointments
  resources :places, only: [:edit, :update]
  resources :cities
  resources :pets

  resources :activities, only: :show do
    resources :meetings, only: [:create]
  end


  get "my_trips", to: "trips#my_trips_index", as: "my_trips"


end
