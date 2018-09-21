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

  def relatorio

  end
end