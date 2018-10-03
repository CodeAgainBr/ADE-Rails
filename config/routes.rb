Rails.application.routes.draw do
  resources :relatorio_jogos
  resources :relatorio_participacao_parentes
  resources :relatorio_jogadores
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  root to: 'home#index'
  
  resources :associados
  resources :clubes
  resources :jogos
  resources :parentes

  get "/agenda", to: "agenda#index", as: :agenda
  get "/agenda/telefonica", to: "agenda#telefonica", as: :agenda_telefonica

  get "/relatorios", to: "relatorios#index", as: :relatorios
  get "/relatorios/aniversario", to: "relatorios#aniversario", as: :relatorios_aniversario
  
  get "/relatorio_jogos", to: "relatorio_jogos#index"
  get "/relatorio_jogador", to: "relatorio_jogador#index"
  get "/relatorio_participacao_parentes", to: "relatorio_participacao_parentes#index"
end
