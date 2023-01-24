Rails.application.routes.draw do
  resources :comments
  resources :posts
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
  post "/posts/new", to: "posts#create"
  delete "/delete/:id", to: "posts#destroy"
  patch "/update/:id", to: "posts#update"
  delete "/logout/:id", to: "sessions#destroy"
  post "/comment/new", to: "comments#create"
  delete "/comment/:id", to: "comments#destroy"
end
