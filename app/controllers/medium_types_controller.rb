class MediumTypesController < ApplicationController
  before_action :set_medium_type, only: %i[show edit update destroy]

  def index
    @q = MediumType.ransack(params[:q])
    @medium_types = @q.result(distinct: true).includes(:artworks,
                                                       :artists).page(params[:page]).per(10)
  end

  def show
    @artwork = Artwork.new
  end

  def new
    @medium_type = MediumType.new
  end

  def edit; end

  def create
    @medium_type = MediumType.new(medium_type_params)

    if @medium_type.save
      redirect_to @medium_type, notice: "Medium type was successfully created."
    else
      render :new
    end
  end

  def update
    if @medium_type.update(medium_type_params)
      redirect_to @medium_type, notice: "Medium type was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @medium_type.destroy
    redirect_to medium_types_url,
                notice: "Medium type was successfully destroyed."
  end

  private

  def set_medium_type
    @medium_type = MediumType.find(params[:id])
  end

  def medium_type_params
    params.require(:medium_type).permit(:medium)
  end
end
