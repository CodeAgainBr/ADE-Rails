class RelatorioJogosController < ApplicationController
  before_action :set_relatorio_jogo, only: [:show, :edit, :update, :destroy]

  # GET /relatorio_jogos/1
  # GET /relatorio_jogos/1.json
  def show
    
  end

  # GET /relatorio_jogos/new
  def new
    @relatorio_jogo = RelatorioJogo.new
    @relatorio_jogo.jogo_id = params[:jogo_id]
  end

  # GET /relatorio_jogos/1/edit
  def edit
  end

  # POST /relatorio_jogos
  # POST /relatorio_jogos.json
  def create
    @relatorio_jogo = RelatorioJogo.new(relatorio_jogo_params)

    respond_to do |format|
      if @relatorio_jogo.save
        @jogo = Jogo.find(@relatorio_jogo.jogo_id)
        @jogo.update(relatorio: true)
        format.html { redirect_to agenda_path, notice: 'Relatorio de jogo cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @relatorio_jogo }
      else
        format.html { render :new }
        format.json { render json: @relatorio_jogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relatorio_jogos/1
  # PATCH/PUT /relatorio_jogos/1.json
  def update
    @relatorio_jogo.jogo_id = params[:jogo_id]

    respond_to do |format|
      if @relatorio_jogo.update(relatorio_jogo_params)
        format.html { redirect_to agenda_path, notice: 'Relatorio de jogo Atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @relatorio_jogo }
      else
        format.html { render :edit }
        format.json { render json: @relatorio_jogo.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relatorio_jogo
      @relatorio_jogo = RelatorioJogo.where(jogo_id: params[:id])[0]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relatorio_jogo_params
      params.require(:relatorio_jogo).permit(:gols_pro, :gols_contra, :observacao, :uniforme, :responsavel_uniforme, :jogo_id)
    end
end
