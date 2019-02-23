class RelatoriosController < ApplicationController

  # GET /relatorios
  def index
  end

  #GET /relatorios/aniversario
  #GET /relatorios/aniversario/pdf
  def aniversario
  end

  def aniversario_pdf
    if params[:referente] == 'geral'
      if params[:tipo] == 'anual'
        @associados = Associado.all.order(:nome)
        @parentes = Parente.all.order(:nome)
        @clubes = Clube.all.order(:nome)
      end

      if params[:tipo] == 'mensal'
        @associados = Associado.where('extract(month from data_nascimento)  = ?', params[:data])
        @parentes = Parente.where('extract(month from data_nascimento)  = ?', params[:data])
        @clubes = Clube.where('extract(month from data_fundacao)  = ?', params[:data])
      end

      if params[:tipo] == 'diario'
        @associados = Associado.where('extract(day from data_nascimento)  = ? and extract(month from data_nascimento)  = ?', params[:data].split('/')[0], params[:data].split('/')[1])
        @parentes = Parente.where('extract(day from data_nascimento)  = ? and extract(month from data_nascimento)  = ?', params[:data].split('/')[0], params[:data].split('/')[1])
        @clubes = Clube.where('extract(day from data_fundacao)  = ? and extract(month from data_fundacao)  = ?', params[:data].split('/')[0], params[:data].split('/')[1])
      end
    end

    if params[:referente] == 'associados'
      if params[:tipo] == 'anual'
        @associados = Associado.all.order(:nome)
      end

      if params[:tipo] == 'mensal'
        @associados = Associado.where('extract(month from data_nascimento)  = ?', params[:data])
      end

      if params[:tipo] == 'diario'
        @associados = Associado.where('extract(day from data_nascimento)  = ? and extract(month from data_nascimento)  = ?', params[:data].split('/')[0], params[:data].split('/')[1])
      end
    end

    if params[:referente] == 'parentes'
      if params[:tipo] == 'anual'
        @parentes = Parente.all.order(:nome)
      end

      if params[:tipo] == 'mensal'
        @parentes = Parente.where('extract(month from data_nascimento)  = ?', params[:data])
      end

      if params[:tipo] == 'diario'
        @parentes = Parente.where('extract(day from data_nascimento)  = ? and extract(month from data_nascimento)  = ?', params[:data].split('/')[0], params[:data].split('/')[1])
      end
    end

    if params[:referente] == 'clubes'
      if params[:tipo] == 'anual'
        @clubes = Clube.all.order(:nome)
      end

      if params[:tipo] == 'mensal'
        @clubes = Clube.where('extract(month from data_fundacao)  = ?', params[:data])
      end

      if params[:tipo] == 'diario'
        @clubes = Clube.where('extract(day from data_fundacao)  = ? and extract(month from data_fundacao)  = ?', params[:data].split('/')[0], params[:data].split('/')[1])
      end
    end
  end

  def campanha
    @jogadores = AvaliacaoJogador.relatorio

    @jogos = RelatorioJogo.all.count

    @relatorio_jogos = RelatorioJogo.all

    @vitorias = 0
    @empates = 0
    @derrotas = 0

    @relatorio_jogos.each do |rj|
      if rj.gols_pro.nil?
        rj.gols_pro = 0
      end

      if rj.gols_contra.nil?
        rj.gols_contra = 0
      end

      if rj.gols_pro > rj.gols_contra
        @vitorias += 1
      elsif rj.gols_pro == rj.gols_contra
        @empates += 1
      else
        @derrotas += 1
      end
    end

    @gols_pro = RelatorioJogo.all.count(:gols_pro)
    @gols_contra = RelatorioJogo.all.count(:gols_contra)
    @gols_saldo = @gols_pro - @gols_contra
  end

  def prato
    @pratos = Associado.select(:prato_preferido).group(:prato_preferido).order(count: :desc, prato_preferido: :asc).count
  end

  def familiar
    @familiar = Parente.all.sort {|a, b| a.associado.nome <=> b.associado.nome}
  end
end
