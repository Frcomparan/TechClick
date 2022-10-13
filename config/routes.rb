# frozen_string_literal: true

Rails.application.routes.draw do
  get 'carts/show'
  resources :categories
  resources :products
  devise_for :users, controllers: {sessions: "sessions"}
  resources :users, only: [], shallow: true do
    resources :commerces
  end

  root 'pages#home'

  get '/my_products' => 'products#my_products', as: 'my_products'
  get '/searcher' => 'pages#searcher', as: 'searcher'
  get '/filter' => 'pages#filter', as: 'filter'
  get '/category_filter' => 'pages#category', as: 'category_filter'

  # Cart routes
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  # LineItems routes
  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items' => "line_items#create"
  get 'line_items/:id' => "line_items#show", as: "line_item"
  delete 'line_items/:id' => "line_items#destroy"
end
