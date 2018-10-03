class RelatoriosController < ApplicationController

	# GET /relatorios
	def index
    respond_to do |format|
      format.html
      format.pdf do
        render template: "relatorios/relatorio",
        pdf: "relatorio"
      end
    end
	end

  #GET /relatorios/aniversario
  #GET /relatorios/aniversario.pdf
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

    respond_to do |format|
      format.html
      format.pdf do
        render template: "relatorios/aniversario",
        pdf: "aniversario"
      end
    end
  end

  # private
  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def aniversario_params
  #     params.require(:aniversario)
  #   end
end