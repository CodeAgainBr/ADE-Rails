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

  resources :relatorio_participacao_parentes
  resources :relatorio_jogadores

  get "/agenda", to: "agenda#index", as: :agenda
  get "/agenda/telefonica", to: "agenda#telefonica", as: :agenda_telefonica

  get "/relatorios", to: "relatorios#index", as: :relatorios
  get "/relatorios/aniversario", to: "relatorios#aniversario", as: :relatorios_aniversario
  get "/relatorios/aniversario/pdf", to: "relatorios#aniversario_pdf", as: :relatorios_aniversario_pdf
  get "/relatorios/prato", to: "relatorios#prato", as: :relatorios_prato
  get "/relatorios/familiar", to: "relatorios#familiar", as: :relatorios_familiar
  
  get "/relatorio_jogos", to: "relatorio_jogos#index"
  get "/relatorio_jogador", to: "relatorio_jogador#index"
  get "/relatorio_participacao_parentes", to: "relatorio_participacao_parentes#index"
end
