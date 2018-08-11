Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get "/agenda", to: "agenda#index"

  resources :jogos
  resources :parentes
  resources :clubes
  resources :associados

  devise_for :users


  root to: 'home#index'
end
