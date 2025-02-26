Rails.application.routes.draw do
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # API namespace
  namespace :api do
    namespace :v1 do
      resources :news, only: [:index, :show, :create, :update, :destroy]  
      post "login", to: "authentication#login"  
    end
  end

  get "*path", to: "frontend#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
