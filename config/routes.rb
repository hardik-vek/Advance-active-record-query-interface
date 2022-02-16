# frozen_string_literal: true
Rails.application.routes.draw do
  root "homes#index"
  get 'products/default_scoped'
  get 'orders/search_order_by_product_name'
  resources :products
  resources :customers
  resources :orders
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

