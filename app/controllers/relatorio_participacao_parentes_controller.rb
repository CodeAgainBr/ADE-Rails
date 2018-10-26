class RelatorioParticipacaoParentesController < ApplicationController
  before_action :set_relatorio_participacao_parente, only: [:show, :edit, :update, :destroy]

  # GET /relatorio_participacao_parentes
  # GET /relatorio_participacao_parentes.json
  def index
    @relatorio_participacao_parentes = RelatorioParticipacaoParente.all
  end

  # GET /relatorio_participacao_parentes/1
  # GET /relatorio_participacao_parentes/1.json
  def show
  end

  # GET /relatorio_participacao_parentes/new
  def new
    @relatorio_participacao_parente = RelatorioParticipacaoParente.new
  end

  # GET /relatorio_participacao_parentes/1/edit
  def edit
  end

  # POST /relatorio_participacao_parentes
  # POST /relatorio_participacao_parentes.json
  def create
    @relatorio_participacao_parente = RelatorioParticipacaoParente.new(relatorio_participacao_parente_params)

    respond_to do |format|
      if @relatorio_participacao_parente.save
        format.html { redirect_to @relatorio_participacao_parente, notice: 'Relatorio participacao parente was successfully created.' }
        format.json { render :show, status: :created, location: @relatorio_participacao_parente }
      else
        format.html { render :new }
        format.json { render json: @relatorio_participacao_parente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relatorio_participacao_parentes/1
  # PATCH/PUT /relatorio_participacao_parentes/1.json
  def update
    respond_to do |format|
      if @relatorio_participacao_parente.update(relatorio_participacao_parente_params)
        format.html { redirect_to @relatorio_participacao_parente, notice: 'Relatorio participacao parente was successfully updated.' }
        format.json { render :show, status: :ok, location: @relatorio_participacao_parente }
      else
        format.html { render :edit }
        format.json { render json: @relatorio_participacao_parente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relatorio_participacao_parentes/1
  # DELETE /relatorio_participacao_parentes/1.json
  def destroy
    @relatorio_participacao_parente.destroy
    respond_to do |format|
      format.html { redirect_to relatorio_participacao_parentes_url, notice: 'Relatorio participacao parente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relatorio_participacao_parente
      @relatorio_participacao_parente = RelatorioParticipacaoParente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relatorio_participacao_parente_params
      params.require(:relatorio_participacao_parente).permit(:parente_id, :relatorio_jogo_id)
    end
end
