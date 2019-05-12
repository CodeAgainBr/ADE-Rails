# RelatorioJogo class
class RelatorioJogo < ApplicationRecord
  belongs_to :jogo
  has_many :avaliacao_jogadores, dependent: :delete_all
  has_many :relatorio_participacao_parentes, dependent: :delete_all
end
