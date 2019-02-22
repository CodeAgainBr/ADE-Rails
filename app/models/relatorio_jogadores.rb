class RelatorioJogadores < ApplicationRecord
  belongs_to :associado
  belongs_to :relatorio_jogo
end
