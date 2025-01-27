Rails.application.routes.draw do
  get "home/index"
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"


  resources :attendances, only: [ :index, :create, :destroy ], param: :event_id
  resources :events do
    collection do
      get "my_events"
    end
  end
  post "send_email", to: "emails#send_email", as: "send_email"
  end
