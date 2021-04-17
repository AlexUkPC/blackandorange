class BandosController < ApplicationController
  before_action :set_bando, only: %i[ show edit update destroy ]

  # GET /bandos or /bandos.json
  def index
    @bandos = Bando.all
  end

  # GET /bandos/1 or /bandos/1.json
  def show
  end

  # GET /bandos/new
  def new
    @bando = Bando.new
  end

  # GET /bandos/1/edit
  def edit
  end

  # POST /bandos or /bandos.json
  def create
    @bando = Bando.new(bando_params)

    respond_to do |format|
      if @bando.save
        format.html { redirect_to @bando, notice: "Bando was successfully created." }
        format.json { render :show, status: :created, location: @bando }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bando.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bandos/1 or /bandos/1.json
  def update
    respond_to do |format|
      if @bando.update(bando_params)
        format.html { redirect_to @bando, notice: "Bando was successfully updated." }
        format.json { render :show, status: :ok, location: @bando }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bando.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bandos/1 or /bandos/1.json
  def destroy
    @bando.destroy
    respond_to do |format|
      format.html { redirect_to bandos_url, notice: "Bando was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bando
      @bando = Bando.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bando_params
      params.require(:bando).permit(:title, :description, :user_id)
    end
end
