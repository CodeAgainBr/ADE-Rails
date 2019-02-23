class Jogo < ApplicationRecord
  belongs_to :clube

  def data_format
    unless data.nil?
      self::data = data.strftime('%d/%m/%Y')
    end
  end
end
