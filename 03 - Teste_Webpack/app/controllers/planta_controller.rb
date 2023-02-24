class PlantaController < ApplicationController
  before_action :set_plantum, only: %i[ show edit update destroy ]

  # GET /planta or /planta.json
  def index
    @planta = Plantum.all
  end

  # GET /planta/1 or /planta/1.json
  def show
  end

  # GET /planta/new
  def new
    @plantum = Plantum.new
  end

  # GET /planta/1/edit
  def edit
  end

  # POST /planta or /planta.json
  def create
    @plantum = Plantum.new(plantum_params)

    respond_to do |format|
      if @plantum.save
        format.html { redirect_to plantum_url(@plantum), notice: "Plantum was successfully created." }
        format.json { render :show, status: :created, location: @plantum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plantum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planta/1 or /planta/1.json
  def update
    respond_to do |format|
      if @plantum.update(plantum_params)
        format.html { redirect_to plantum_url(@plantum), notice: "Plantum was successfully updated." }
        format.json { render :show, status: :ok, location: @plantum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plantum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planta/1 or /planta/1.json
  def destroy
    @plantum.destroy

    respond_to do |format|
      format.html { redirect_to planta_url, notice: "Plantum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plantum
      @plantum = Plantum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plantum_params
      params.require(:plantum).permit(:nome, :cor, :valor)
    end
end
