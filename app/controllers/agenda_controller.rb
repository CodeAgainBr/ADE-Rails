class AgendaController < ApplicationController

  # GET /agenda
  def index
    @data = Date.current
    
    @meses = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outrubro', 'Novembro', 'Dezembro']

    @jogos_ano = []
    @i = 1
    while @i <= 12
      @jogos = Jogo.where("extract(month from data)  = ? and extract(year from data) = ?", @i.to_s, @data.strftime("%Y")).order(:data)
      @jogos_ano.push(@jogos)
      @i += 1
    end
  end
end
