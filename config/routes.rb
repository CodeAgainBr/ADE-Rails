Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  root to: 'home#index'
  
  resources :associados
  resources :parentes
  resources :clubes
  resources :jogos

  get "/agenda", to: "agenda#index", as: :agenda
  get "/agenda/telefonica", to: "agenda#telefonica", as: :agenda_telefonica
  get "/relatorios", to: "relatorios#index", as: :relatorios
end
