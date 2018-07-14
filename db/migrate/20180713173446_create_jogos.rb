class CreateJogos < ActiveRecord::Migration[5.0]
  def change
    create_table :jogos do |t|
      t.date :data
      t.string :horario
      t.string :local
      t.boolean :relatorio
      t.belongs_to :clube, foreign_key: true

      t.timestamps
    end
  end
end
