class ParentesController < ApplicationController
  before_action :set_parente, only: [:show, :edit, :update, :destroy]

  # GET /parentes
  # GET /parentes.json
  def index
    @parentes = Parente.where(associado_id: params[:associado_id])
  end

  # GET /parentes/1
  # GET /parentes/1.json
  def show
  end

  # GET /parentes/new
  def new
    @parente = Parente.new
    @parente.associado_id = params[:associado_id]
  end

  # GET /parentes/1/edit
  def edit
    @parente.associado_id = params[:associado_id]
  end

  # POST /parentes
  # POST /parentes.json
  def create
    @parente = Parente.new(parente_params)
    @associado = @parente.associado_id
    respond_to do |format|
      if @parente.save
        format.html { redirect_to parentes_path(associado_id: @associado) }
        format.json { render :show, status: :created, location: @parente }
      else
        format.html { render :new }
        format.json { render json: @parente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parentes/1
  # PATCH/PUT /parentes/1.json
  def update
    @associado = @parente.associado_id
    respond_to do |format|
      if @parente.update(parente_params)
        format.html { redirect_to parentes_path(associado_id: @associado) }
        format.json { render :show, status: :ok, location: @parente }
      else
        format.html { render :edit }
        format.json { render json: @parente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parentes/1
  # DELETE /parentes/1.json
  def destroy
    @associado = @parente.associado_id
    @parente.destroy
    respond_to do |format|
      format.html { redirect_to parentes_path(associado_id: @associado) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parente
      @parente = Parente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parente_params
      params.require(:parente).permit(:nome, :parentesco, :data_nascimento, :associado_id)
    end
end
