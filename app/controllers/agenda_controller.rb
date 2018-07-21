class AgendaController < ApplicationController

  # GET /agenda
  def index
    @data = Date.current
    
    @meses = ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outrubro', 'Novembro', 'Dezembro']

    @jogos_ano = []
    @i = 1
    while @i <= 12
      @data_atual = @i.to_s + @data.strftime("%Y")
      @jogos = Jogo.where("cast(strftime('%m%Y', data) as int) = ?", @data_atual).order(:data)
      @jogos_ano.push(@jogos)
      @i += 1
    end
  end
end
