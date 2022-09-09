# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "sessions"}
  root 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [], shallow: true do
    resources :commerces
  end
end
