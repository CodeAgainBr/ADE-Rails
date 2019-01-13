class RelatorioParticipacaoParentesController < ApplicationController
  before_action :set_relatorio_participacao_parente, only: [:show, :update, :destroy]

  respond_to :html

  def index
    @relatorio_participacao_parentes = RelatorioParticipacaoParente.all
    respond_modal_with(@relatorio_participacao_parentes)
  end

  def show
    respond_modal_with(@relatorio_participacao_parentes)
  end

  def new
    @relatorio_participacao_parente = RelatorioParticipacaoParente.where(parente_id: params[:parente_id], relatorio_jogo_id: params[:relatorio_jogo_id])[0]
    if @relatorio_participacao_parente == nil
      @relatorio_participacao_parente = RelatorioParticipacaoParente.new
      @relatorio_participacao_parente.parente_id = params[:parente_id]
      @relatorio_participacao_parente.relatorio_jogo_id = params[:relatorio_jogo_id]
    end

    respond_modal_with(@relatorio_participacao_parentes)
  end

  def edit
    @relatorio_participacao_parente = RelatorioParticipacaoParente.where(parente_id: params[:parente_id], relatorio_jogo_id: params[:relatorio_jogo_id])[0]
    respond_modal_with(@relatorio_participacao_parentes)
  end

  def create
    @relatorio_participacao_parente = RelatorioParticipacaoParente.new(relatorio_participacao_parente_params)
    @relatorio_participacao_parente.save
  end

  def update
    @relatorio_participacao_parente.update(relatorio_participacao_parente_params)
  end

  def destroy
    @relatorio_participacao_parente.destroy
    respond_modal_with(@relatorio_participacao_parentes)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relatorio_participacao_parente
      @relatorio_participacao_parente = RelatorioParticipacaoParente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relatorio_participacao_parente_params
      params.require(:relatorio_participacao_parente).permit(:parente_id, :relatorio_jogo_id, :participou)
    end
end
