class BandosController < ApplicationController
  before_action :set_bando, only: %i[ show edit update destroy like unlike ]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :like, :unlike]
  impressionist actions:[:show], unique: [:impressionable_type, :impressionable_id, :session_hash]
  # GET /bandos or /bandos.json
  def index
    @bandos = Bando.all.order('created_at DESC')
  end

  # GET /bandos/1 or /bandos/1.json
  def show
  end

  # GET /bandos/new
  def new
    @bando = current_user.bandos.build
  end

  # GET /bandos/1/edit
  def edit
  end

  # POST /bandos or /bandos.json
  def create
    @bando = current_user.bandos.build(bando_params)

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
  def like
    @bando.liked_by current_user
     respond_to do |format|
       format.html { redirect_back fallback_location: root_path}
       format.js {render layout: false}
     end
   end
   def unlike
     @bando.unliked_by current_user
     respond_to do |format|
       format.html { redirect_back fallback_location: root_path}
       format.js {render layout: false}
     end  
   end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bando
      @bando = Bando.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bando_params
      params.require(:bando).permit(:title, :description, :user_bando)
    end
end
