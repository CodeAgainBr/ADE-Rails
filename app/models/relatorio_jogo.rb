# RelatorioJogo class
class RelatorioJogo < ApplicationRecord
  has_many :avaliacao_jogadores, dependent: :destroy
  has_many :relatorio_participacao_parentes, dependent: :destroy
  belongs_to :jogo
end
