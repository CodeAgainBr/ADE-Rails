# Associado class
class Associado < ApplicationRecord
  has_many :parentes, dependent: :destroy
  has_many :avaliacao_jogadores, dependent: :destroy

  def parentes
    Parente.where(associado_id: id)
  end
end
