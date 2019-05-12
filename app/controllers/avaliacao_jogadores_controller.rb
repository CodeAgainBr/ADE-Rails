class AvaliacaoJogadoresController < ApplicationController
  before_action :set_avaliacao_jogador, only: %i[show update destroy]
  before_action :set_aval_jog_by_paramters, only: %i[new edit]

  respond_to :html

  def index
    @avaliacao_jogadores = AvaliacaoJogador.all
    respond_modal_with(@relatorio_jogador)
  end

  def show
    respond_modal_with(@avaliacao_jogador)
  end

  def new
    respond_modal_with(@avaliacao_jogador)
  end

  def edit
    respond_modal_with(@avaliacao_jogador)
  end

  def create
    @avaliacao_jogador = AvaliacaoJogador.new(avaliacao_jogador_params)
    @avaliacao_jogador.save
  end

  def update
    @avaliacao_jogador.update(avaliacao_jogador_params)
  end

  def destroy
    @avaliacao_jogador.destroy
    respond_modal_with(@avaliacao_jogador)
  end

  private

  def set_avaliacao_jogador
    @avaliacao_jogador = AvaliacaoJogador.find(params[:id])
  end

  def avaliacao_jogador_params
    params.require(:avaliacao_jogador).permit(:status, :participante_confraternizacao, :cartao_amarelo, :cartao_vermelho, :goleiro, :gol_pro, :gol_sofrido, :destaque, :associado_id, :relatorio_jogo_id, :associado_id)
  end

  def set_aval_jog_by_paramters
    @avaliacao_jogador = AvaliacaoJogador.find_by(
      associado_id: params[:associado_id],
      relatorio_jogo_id: params[:relatorio_jogo_id]
    )

    if @avaliacao_jogador.nil?
      @avaliacao_jogador = AvaliacaoJogador.new
      @avaliacao_jogador.associado_id = params[:associado_id]
      @avaliacao_jogador.relatorio_jogo_id = params[:relatorio_jogo_id]
    end
  end
end
