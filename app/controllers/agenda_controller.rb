class AgendaController < ApplicationController
  # GET /agenda
  def index
    @data = Date.current

    @meses = %w[
      Janeiro
      Fevereiro
      Março
      Abril
      Maio
      Junho
      Julho
      Agosto
      Setembro
      Outrubro
      Novembro
      Dezembro
    ]

    @jogos_ano = []
    @months = 1

    while @months <= 12
      @jogos = Jogo.where(
        'extract(month from data)  = ? and extract(year from data) = ?',
        @months.to_s,
        @data.strftime('%Y')
      ).order(:data)

      @jogos_ano.push(@jogos)
      @months += 1
    end
  end

  # GET /agenda/telefonica
  def telefonica
    @associados = Associado.all.order(:nome)
  end
end
