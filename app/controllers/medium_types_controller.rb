class MediumTypesController < ApplicationController
  before_action :set_medium_type, only: [:show, :edit, :update, :destroy]

  # GET /medium_types
  def index
    @medium_types = MediumType.all
  end

  # GET /medium_types/1
  def show
  end

  # GET /medium_types/new
  def new
    @medium_type = MediumType.new
  end

  # GET /medium_types/1/edit
  def edit
  end

  # POST /medium_types
  def create
    @medium_type = MediumType.new(medium_type_params)

    if @medium_type.save
      redirect_to @medium_type, notice: 'Medium type was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /medium_types/1
  def update
    if @medium_type.update(medium_type_params)
      redirect_to @medium_type, notice: 'Medium type was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /medium_types/1
  def destroy
    @medium_type.destroy
    redirect_to medium_types_url, notice: 'Medium type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medium_type
      @medium_type = MediumType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def medium_type_params
      params.require(:medium_type).permit(:medium)
    end
end
