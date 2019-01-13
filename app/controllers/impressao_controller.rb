class ImpressaoController < ApplicationController

	def aniversario
		if params[:referente] == "geral"
      if params[:tipo] == "anual"
        @associados = Associado.all.order(:nome)
        @parentes = Parente.all.order(:nome)
        @clubes = Clube.all.order(:nome)
      elsif params[:tipo] == "mensal"
        @associados = Associado.where("extract(month from data_nascimento)  = ?", params[:data])
        @parentes = Parente.where("extract(month from data_nascimento)  = ?", params[:data])
        @clubes = Clube.where("extract(month from data_fundacao)  = ?", params[:data])
      elsif params[:tipo] == "diario"
        @associados = Associado.where("extract(day from data_nascimento)  = ? and extract(month from data_nascimento)  = ?", params[:data].split("/")[0], params[:data].split("/")[1])
        @parentes = Parente.where("extract(day from data_nascimento)  = ? and extract(month from data_nascimento)  = ?", params[:data].split("/")[0], params[:data].split("/")[1])
        @clubes = Clube.where("extract(day from data_fundacao)  = ? and extract(month from data_fundacao)  = ?", params[:data].split("/")[0], params[:data].split("/")[1])
      end
    elsif params[:referente] == "associados"
      if params[:tipo] == "anual"
        @associados = Associado.all.order(:nome)
        @parentes = []
        @clubes = []
      elsif params[:tipo] == "mensal"
        @associados = Associado.where("extract(month from data_nascimento)  = ?", params[:data])
        @parentes = []
        @clubes = []
      elsif params[:tipo] == "diario"
        @associados = Associado.where("extract(day from data_nascimento)  = ? and extract(month from data_nascimento)  = ?", params[:data].split("/")[0], params[:data].split("/")[1])
        @parentes = []
        @clubes = []
      end
    elsif params[:referente] == "parentes"
      if params[:tipo] == "anual"
        @associados = []
        @parentes = Parente.all.order(:nome)
        @clubes = []
      elsif params[:tipo] == "mensal"
        @associados = []
        @parentes = Parente.where("extract(month from data_nascimento)  = ?", params[:data])
        @clubes = []
      elsif params[:tipo] == "diario"
        @associados = []
        @parentes = Parente.where("extract(day from data_nascimento)  = ? and extract(month from data_nascimento)  = ?", params[:data].split("/")[0], params[:data].split("/")[1])
        @clubes = []
      end
    elsif params[:referente] == "clubes"
      if params[:tipo] == "anual"
        @associados = []
        @parentes = []
        @clubes = Clube.all.order(:nome)
      elsif params[:tipo] == "mensal"
        @associados = []
        @parentes = []
        @clubes = Clube.where("extract(month from data_fundacao)  = ?", params[:data])
      elsif params[:tipo] == "diario"
        @associados = []
        @parentes = []
        @clubes = Clube.where("extract(day from data_fundacao)  = ? and extract(month from data_fundacao)  = ?", params[:data].split("/")[0], params[:data].split("/")[1])
      end
    end
	end

	def prato
    @pratos = Associado.select(:prato_preferido).group(:prato_preferido).order(count: :desc, prato_preferido: :asc).count
  end

  def familiar
    @familiar = Parente.all.sort {|a, b| a.associado.nome <=> b.associado.nome}
  end
end
