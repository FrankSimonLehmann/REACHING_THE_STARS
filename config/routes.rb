Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :stars do
    resources :bookings
  end

  get "home", to: "pages#home"
  get "booking", to: "pages#booking"
  get "ownedstars", to: "pages#ownedstars"
  get "profile", to: "pages#profile"

end
