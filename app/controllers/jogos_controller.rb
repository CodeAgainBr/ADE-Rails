class JogosController < ApplicationController
  before_action :set_jogo, only: [:show, :edit, :update, :destroy]

  # GET /jogos
  # GET /jogos.json
  def index
    @jogos = Jogo.order(id: :desc)
    @jogos.each do |jogo|
      jogo.clube = Clube.find(jogo.clube)
    end
  end

  # GET /jogos/1
  # GET /jogos/1.json
  def show
  end

  # GET /jogos/new
  def new
    @jogo = Jogo.new
    @clubes = Clube.order(:name)
  end

  # GET /jogos/1/edit
  def edit
    @clubes = Clube.order(:name)
  end

  # POST /jogos
  # POST /jogos.json
  def create
    @jogo = Jogo.new(jogo_params)

    respond_to do |format|
      if @jogo.save
        format.html { redirect_to jogos_url }
        format.json { render :show, status: :created, location: @jogo }
      else
        format.html { render :new }
        format.json { render json: @jogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jogos/1
  # PATCH/PUT /jogos/1.json
  def update
    respond_to do |format|
      if @jogo.update(jogo_params)
        format.html { redirect_to jogos_url }
        format.json { render :show, status: :ok, location: @jogo }
      else
        format.html { render :edit }
        format.json { render json: @jogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jogos/1
  # DELETE /jogos/1.json
  def destroy
    @jogo.destroy
    respond_to do |format|
      format.html { redirect_to jogos_url }
      format.json { head :no_content }
    end
  end

  private

  def set_jogo
    @jogo = Jogo.find(params[:id])

    @jogo.date_format
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def jogo_params
    params.require(:jogo).permit(:data, :horario, :local, :relatorio, :campo_adversario, :cep, :rua, :bairro, :cidade, :estado, :numero, :clube_id)
  end
end
