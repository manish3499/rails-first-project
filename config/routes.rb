Rails.application.routes.draw do
  get 'orders/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "login#index"

  get "/login", to: "login#index"
  post "/login", to: "login#create"

  get "/registration/new", to: "registration#new"
  post "/registration", to: "registration#create"

  get "/products", to: "products#index"
  get "/products/new", to: "products#new"
  get "/products/:id", to: "products#show"
  post "/products", to: "products#create"
  
  get "/cart", to: "cart#index"
  post "/cart", to: "cart#create"

  get "/orders", to: "orders#index"
  post "/orders", to: "orders#create"
end
