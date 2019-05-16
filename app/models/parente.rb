# Parente class
class Parente < ApplicationRecord
  belongs_to :associado
  has_many :relatorio_participacao_parentes, dependent: :destroy
end
