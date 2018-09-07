class RelatoriosController < ApplicationController

	# GET /relatorios
	def index
    respond_to do |format|
      format.html

      format.pdf { render pdf: "home",
        header: { center: "Home Relatórios" },
        footer: { center: "[page] de [topage]" }
      }
    end
	end
end