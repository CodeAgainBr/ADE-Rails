class HomeController < ApplicationController
  def index
    Time.zone = 'America/Sao_Paulo'
    @data = Date.current

    @jogos = Jogo.where('data >= ?', @data).order(:data).limit(2)
  end
end
