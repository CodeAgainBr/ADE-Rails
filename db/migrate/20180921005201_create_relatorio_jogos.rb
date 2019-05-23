class CreateRelatorioJogos < ActiveRecord::Migration[5.0]
  def change
    create_table :relatorio_jogos do |t|
      t.integer :gols_pro
      t.integer :gols_contra
      t.string :observacao
      t.string :uniforme
      t.string :responsavel_uniforme
      t.belongs_to :jogo, foreign_key: true

      t.timestamps
    end
  end
end
