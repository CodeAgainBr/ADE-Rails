class CreateClubes < ActiveRecord::Migration[5.0]
  def change
    create_table :clubes do |t|
      t.string :nome, null: false
      t.string :cep
      t.string :cep_campo
      t.string :rua
      t.string :rua_campo
      t.string :bairro
      t.string :bairro_campo
      t.string :cidade
      t.string :cidade_campo
      t.string :estado
      t.string :estado_campo
      t.integer :numero
      t.integer :numero_campo
      t.string :categoria
      t.string :cor_camisa_uniforme
      t.string :cor_bermuda_uniforme
      t.string :cor_meias_uniforme
      t.boolean :campo
      t.string :telefone_clube
      t.string :telefone_contato
      t.string :nome_contato
      t.date :data_fundacao

      t.timestamps
    end
  end
end
