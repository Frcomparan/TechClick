# frozen_string_literal: true

Rails.application.routes.draw do
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
end
