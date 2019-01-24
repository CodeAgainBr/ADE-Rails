class AvaliacaoJogador < ApplicationRecord
  belongs_to :associado
  belongs_to :relatorio_jogo

  def self.relatorio
    self.find_by_sql("
      select
      ass.nome as nome,
      count(aj.id) as total_de_jogos,
      count(aj.cartao_amarelo) as amarelo,
      count(aj.cartao_vermelho) as vermelho,
      count(aj.gol_pro) as gols
      from avaliacao_jogadores as aj
      inner join associados as ass on aj.associado_id = ass.id
      group by nome
    ")
  end
end
