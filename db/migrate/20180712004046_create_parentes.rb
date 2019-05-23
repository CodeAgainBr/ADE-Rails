class CreateParentes < ActiveRecord::Migration[5.0]
  def change
    create_table :parentes do |t|
      t.string :nome, null: false
      t.string :parentesco
      t.date :data_nascimento
      t.belongs_to :associado, foreign_key: true

      t.timestamps
    end
  end
end
