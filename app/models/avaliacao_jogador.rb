class AvaliacaoJogador < ApplicationRecord
  belongs_to :associado
  belongs_to :relatorio_jogo
end
