Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  root to: 'home#index'
  
  resources :associados
  resources :clubes
  resources :jogos
  resources :parentes

  resources :relatorio_jogos
  get "/relatorio_jogos/new/:jogo_id", to: "relatorio_jogos#new", as: :novo_relatorio_jogo

  resources :relatorio_jogadores

  resources :avaliacao_jogadores
  get "/avaliacao/jogador/new/:associado_id/:relatorio_jogo_id", to: "avaliacao_jogadores#new", as: :nova_avaliacao_jogador
  get "/avaliacao/jogador/edit/:associado_id", to: "avaliacao_jogadores#new", as: :editar_avaliacao_jogador

  resources :relatorio_participacao_parentes

  get "/agenda", to: "agenda#index", as: :agenda
  get "/agenda/telefonica", to: "agenda#telefonica", as: :agenda_telefonica

  get "/relatorios", to: "relatorios#index", as: :relatorios
  get "/relatorios/aniversario", to: "relatorios#aniversario", as: :relatorios_aniversario
  get "/relatorios/prato.pdf", to: "relatorios#prato", as: :relatorios_prato
  get "/relatorios/familiar.pdf", to: "relatorios#familiar", as: :relatorios_familiar
end
