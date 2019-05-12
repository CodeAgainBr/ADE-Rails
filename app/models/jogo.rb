# Jogo class
class Jogo < ApplicationRecord
  belongs_to :clube
  has_many :relatorio_jogos, dependent: :delete_all

  def date_format
    unless data.nil?
      self::data = data.strftime('%d/%m/%Y')
    end
  end

  def date_week
	  unless data.nil?
		  case data.strftime('%A')
		  when 'Sunday'
			  'Domingo'
		  when 'Monday'
			  'Segunda-feira'
		  when 'Tuesday'
			  'Terça-feira'
		  when 'Wednesday'
			  'Quarta-feira'
		  when 'Thursday'
			  'Quinta-feira'
		  when 'Friday'
			  'Sexta-feira'
		  else
			  'Sábado'
		  end
		end
  end
end
