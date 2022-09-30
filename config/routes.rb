# frozen_string_literal: true

Rails.application.routes.draw do
  resources :products
  devise_for :users, controllers: {sessions: "sessions"}
  resources :users, only: [], shallow: true do
    resources :commerces
  end
  root 'pages#home'
  get '/my_products' => 'products#my_products', as: 'my_products'
end
