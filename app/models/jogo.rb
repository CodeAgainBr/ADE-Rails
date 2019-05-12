class Jogo < ApplicationRecord
  belongs_to :clube

  def date_format
    self.data = data.strftime('%d/%m/%Y') unless data.nil?
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

  def gols_pro
    RelatorioJogo.find_by_jogo_id(id).gols_pro if relatorio
  end

  def gols_contra
    RelatorioJogo.find_by_jogo_id(id).gols_contra if relatorio
  end
end
