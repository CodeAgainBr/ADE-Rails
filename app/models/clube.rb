# Clube class
class Clube < ApplicationRecord
  has_many :jogos, dependent: :delete_all
end
