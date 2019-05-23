class CreateRelatorioJogadores < ActiveRecord::Migration[5.0]
  def change
    create_table :relatorio_jogadores do |t|
      t.string :status
      t.boolean :participante_confraternizacao
      t.integer :cartao_amarelo
      t.integer :cartao_vermelho
      t.boolean :goleiro
      t.integer :gol_pro
      t.integer :gol_sofrido
      t.boolean :destaque
      t.belongs_to :associado, foreign_key: true
      t.belongs_to :relatorio_jogo, foreign_key: true

      t.timestamps
    end
  end
end
