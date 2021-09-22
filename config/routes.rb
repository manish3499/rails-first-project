Rails.application.routes.draw do
  
  
  get 'test', to: "test#index"
  resources :coupons
  get 'orders/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "products#index"

  get "/login", to: "login#index"
  post "/login", to: "login#create"
  get "/logout", to: "login#logout"

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

  get 'admin', to: "admin#index"
end
