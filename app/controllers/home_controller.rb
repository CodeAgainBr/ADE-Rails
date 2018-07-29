class HomeController < ApplicationController
	def index
		Time.zone = "America/Sao_Paulo"
		@data = Date.current

		@jogo = Jogo.where("data >= ?", @data).order(:data).limit(1)[0]
	end
end
