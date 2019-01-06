Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  root to: 'home#index'
  
  resources :associados
  resources :clubes
  resources :jogos
  resources :parentes

  resources :relatorio_jogos
  resources :relatorio_jogadores
  resources :relatorio_participacao_parentes

  get "/agenda", to: "agenda#index", as: :agenda
  get "/agenda/telefonica", to: "agenda#telefonica", as: :agenda_telefonica

  get "/relatorios", to: "relatorios#index", as: :relatorios
  get "/relatorios/aniversario", to: "relatorios#aniversario", as: :relatorios_aniversario
  get "/relatorios/prato.pdf", to: "relatorios#prato", as: :relatorios_prato
  get "/relatorios/familiar.pdf", to: "relatorios#familiar", as: :relatorios_familiar
  
  # get "/relatorio_jogos", to: "relatorio_jogos#index"
  # get "/relatorio_jogador", to: "relatorio_jogador#index"
  # get "/relatorio_participacao_parentes", to: "relatorio_participacao_parentes#index"
end
