Rails.application.routes.draw do
  resources :cart_items
  resources :carts
  root "categories#index"
  resources :products do
    resources :product_features
  end
  resources :brands
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
