class CreateAssociados < ActiveRecord::Migration[5.0]
  def change
    create_table :associados do |t|
      t.string :nome, null: false
      t.date :data_nascimento
      t.string :local_nascimento
      t.string :rg
      t.string :cpf
      t.string :cep
      t.string :email
      t.string :cidade
      t.string :estado
      t.string :bairro
      t.string :rua
      t.integer :numero
      t.string :telefone
      t.string :prato_preferido
      t.text :observacoes

      t.timestamps
    end
  end
end
