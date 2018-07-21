class CreateJogos < ActiveRecord::Migration[5.0]
  def change
    create_table :jogos do |t|
      t.date :data, null: false
      t.string :horario
      t.string :local
      t.boolean :relatorio
      t.boolean :campo_adversario
      t.string :cep
      t.string :rua
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.integer :numero
      t.belongs_to :clube, foreign_key: true

      t.timestamps
    end
  end
end
