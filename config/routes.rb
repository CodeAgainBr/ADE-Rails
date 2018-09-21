Rails.application.routes.draw do
  resources :relatorio_jogos
  resources :relatorio_participacao_parentes
  resources :relatorio_jogadores
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  root to: 'home#index'
  
  resources :associados
  resources :parentes
  resources :clubes
  resources :jogos

  get "/agenda", to: "agenda#index"
  get "/relatorio_jogos", to: "relatorio_jogos#index"
  get "/relatorio_jogador", to: "relatorio_jogador#index"
  get "/relatorio_participacao_parentes", to: "relatorio_participacao_parentes#index"
  get "/relatorios", to: "relatorios#index", as: :relatorios
end
