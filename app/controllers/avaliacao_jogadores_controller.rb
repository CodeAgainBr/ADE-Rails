class AvaliacaoJogadoresController < ApplicationController
  before_action :set_avaliacao_jogador, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @avaliacao_jogadores = AvaliacaoJogador.all
    respond_with(@avaliacao_jogadores)
  end

  def show
    respond_with(@avaliacao_jogador)
  end

  def new
    @avaliacao_jogador = AvaliacaoJogador.new
    respond_with(@avaliacao_jogador)
  end

  def edit
  end

  def create
    @avaliacao_jogador = AvaliacaoJogador.new(avaliacao_jogador_params)
    @avaliacao_jogador.save
    respond_with(@avaliacao_jogador)
  end

  def update
    @avaliacao_jogador.update(avaliacao_jogador_params)
    respond_with(@avaliacao_jogador)
  end

  def destroy
    @avaliacao_jogador.destroy
    respond_with(@avaliacao_jogador)
  end

  private
    def set_avaliacao_jogador
      @avaliacao_jogador = AvaliacaoJogador.find(params[:id])
    end

    def avaliacao_jogador_params
      params.require(:avaliacao_jogador).permit(:status, :participante_confraternizacao, :cartao_amarelo, :cartao_vermelho, :goleiro, :gol_pro, :gol_sofrido, :destaque, :associado_id, :relatorio_jogo_id)
    end
end
