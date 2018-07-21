class HomeController < ApplicationController
	def index
		@data = Integer(Date.current.strftime("%d%m%Y"))

		@jogo = Jogo.where("cast(strftime('%d%m%Y', data) as int) >= ?", @data).limit(1)
	end
end
