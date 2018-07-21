class Clube < ApplicationRecord
	has_many :jogos, dependent: :destroy
end
