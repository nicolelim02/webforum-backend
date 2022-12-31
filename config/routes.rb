Rails.application.routes.draw do
  resources :sessions
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "sessions#show"

  post "/signup", to: "users#create"
  get "/dashboard", to: "users#show"
  post "/login", to: "sessions#create"
  get "/authorized", to: "sessions#show"
end
