class RelatorioParticipacaoParente < ApplicationRecord
  belongs_to :parente
  belongs_to :relatorio_jogo
end
