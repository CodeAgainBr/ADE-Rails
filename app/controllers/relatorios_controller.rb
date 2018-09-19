class RelatoriosController < ApplicationController

	# GET /relatorios
	def index
    respond_to do |format|
      format.pdf do 
        render template: "relatorios/relatorio",
        pdf: "relatorio"
      end
    end
	end
end