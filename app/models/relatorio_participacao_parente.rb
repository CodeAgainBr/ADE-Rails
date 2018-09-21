class RelatorioParticipacaoParente < ApplicationRecord
  belongs_to :parente
  belongs_to :Relatorio_jogo
end
