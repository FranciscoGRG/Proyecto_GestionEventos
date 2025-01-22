Rails.application.routes.draw do
  get "home/index"
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  resources :events do
    member do
      post "assist"
    end
  end
end
