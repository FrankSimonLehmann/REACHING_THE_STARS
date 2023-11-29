Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :stars

  get "home", to: "pages#home"
  get "booking", to: "pages#booking"
  get "ownedstars", to: "pages#ownedstars"
  get "profile", to: "pages#profile"

end
