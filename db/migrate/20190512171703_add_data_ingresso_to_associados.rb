class AddDataIngressoToAssociados < ActiveRecord::Migration[5.0]
  def change
    add_column :associados, :data_ingresso, :date
  end
end
