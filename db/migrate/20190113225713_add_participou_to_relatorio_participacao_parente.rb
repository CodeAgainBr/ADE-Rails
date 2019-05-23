class AddParticipouToRelatorioParticipacaoParente < ActiveRecord::Migration[5.0]
  def change
    add_column :relatorio_participacao_parentes, :participou, :boolean
  end
end
