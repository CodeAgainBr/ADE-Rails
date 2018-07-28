class HomeController < ApplicationController
	def index
		@data = Date.current

		@jogo = Jogo.where("data >= ?", @data).order(:data).limit(1)[0]
	end
end
