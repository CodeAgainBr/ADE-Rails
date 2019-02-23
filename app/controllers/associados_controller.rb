class AssociadosController < ApplicationController
  before_action :set_associado, only: [:show, :edit, :update, :destroy]

  # GET /associados
  # GET /associados.json
  def index
    @associados = Associado.all.order(:nome)
  end

  # GET /associados/1
  # GET /associados/1.json
  def show
    @parentes = Parente.where(associado_id: @associado.id)
  end

  # GET /associados/new
  def new
    @associado = Associado.new
  end

  # GET /associados/1/edit
  def edit
    if (@associado.data_nascimento != nil)
      @associado.data_nascimento = @associado.data_nascimento.strftime("%d/%m/%Y")
    end
  end

  # POST /associados
  # POST /associados.json
  def create
    @associado = Associado.new(associado_params)

    respond_to do |format|
      if @associado.save
        format.html { redirect_to associados_url }
        format.json { render :show, status: :created, location: @associado }
      else
        format.html { render :new }
        format.json { render json: @associado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /associados/1
  # PATCH/PUT /associados/1.json
  def update
    respond_to do |format|
      if @associado.update(associado_params)
        format.html { redirect_to associados_url }
        format.json { render :show, status: :ok, location: @associado }
      else
        format.html { render :edit }
        format.json { render json: @associado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /associados/1
  # DELETE /associados/1.json
  def destroy
    @associado.destroy
    respond_to do |format|
      format.html { redirect_to associados_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_associado
      @associado = Associado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def associado_params
      params.require(:associado).permit(:nome, :data_nascimento, :local_nascimento, :rg, :cpf, :cep, :email, :cidade, :estado, :bairro, :rua, :numero, :telefone, :prato_preferido, :observacoes)
    end
end
