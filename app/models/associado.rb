class Associado < ApplicationRecord
	has_many :parentes, dependent: :destroy
end
