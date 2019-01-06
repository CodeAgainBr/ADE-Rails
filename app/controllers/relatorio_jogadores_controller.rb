class RelatorioJogadoresController < ApplicationController
  before_action :set_relatorio_jogador, only: [:show, :edit, :update, :destroy]

  # GET /relatorio_jogadores
  # GET /relatorio_jogadores.json
  def index
    @relatorio_jogadores = RelatorioJogadores.all
  end

  # GET /relatorio_jogadores/1
  # GET /relatorio_jogadores/1.json
  def show
  end

  # GET /relatorio_jogadores/new
  def new
    @relatorio_jogador = RelatorioJogadores.new
    respond_modal_with @relatorio_jogador
  end

  # GET /relatorio_jogadores/1/edit
  def edit
  end

  # POST /relatorio_jogadores
  # POST /relatorio_jogadores.json
  def create
    @relatorio_jogador = RelatorioJogadores.new(relatorio_jogador_params)

    respond_to do |format|
      if @relatorio_jogador.save
        format.html { respond_modal_with @relatorio_jogador, notice: "Relatório individual realizado com sucesso.", location: @relatorio_jogador }
        format.json { render :show, status: :created, location: @relatorio_jogador }
      else
        format.html { render :new }
        format.json { render json: @relatorio_jogador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relatorio_jogadores/1
  # PATCH/PUT /relatorio_jogadores/1.json
  def update
    respond_to do |format|
      if @relatorio_jogador.update(relatorio_jogador_params)
        format.html { redirect_to @relatorio_jogador, notice: 'Relatorio jogadores was successfully updated.' }
        format.json { render :show, status: :ok, location: @relatorio_jogador }
      else
        format.html { render :edit }
        format.json { render json: @relatorio_jogador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relatorio_jogadores/1
  # DELETE /relatorio_jogadores/1.json
  def destroy
    @relatorio_jogador.destroy
    respond_to do |format|
      format.html { redirect_to relatorio_jogadores_path, notice: 'Relatorio jogadores was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relatorio_jogador
      @relatorio_jogador = RelatorioJogadores.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relatorio_jogador_params
      params.require(:relatorio_jogador).permit(:status, :participante_confraternizacao, :cartao_amarelo, :cartao_vermelho, :goleiro, :gol_pro, :gol_sofrido, :destaque, :associado_id, :relatorio_jogo_id)
    end
end
