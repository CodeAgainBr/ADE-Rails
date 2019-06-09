# AvaliacaoJogador class
class AvaliacaoJogador < ApplicationRecord
  belongs_to :associado
  belongs_to :relatorio_jogo

  def self.relatorio
    find_by_sql("
      select
      ass.nome as nome,
      count(aj.id) as total_de_jogos,
      sum(aj.cartao_amarelo) as amarelo,
      sum(aj.cartao_vermelho) as vermelho,
      sum(aj.gol_pro) as gols
      from avaliacao_jogadores as aj
      inner join associados as ass on aj.associado_id = ass.id
      group by nome
    ")
  end
end
