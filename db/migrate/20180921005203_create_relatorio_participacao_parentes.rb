class CreateRelatorioParticipacaoParentes < ActiveRecord::Migration[5.0]
  def change
    create_table :relatorio_participacao_parentes do |t|
      t.belongs_to :parente, foreign_key: true
      t.belongs_to :relatorio_jogo, foreign_key: true

      t.timestamps
    end
  end
end
