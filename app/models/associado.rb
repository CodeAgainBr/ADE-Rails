# Associado class
class Associado < ApplicationRecord
  has_many :parentes, dependent: :delete_all
  has_many :avaliacao_jogadores, dependent: :delete_all
end
