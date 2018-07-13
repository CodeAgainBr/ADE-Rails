Rails.application.routes.draw do
  resources :parentes
  resources :clubes
  resources :associados
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users


  root to: 'home#index'
end
