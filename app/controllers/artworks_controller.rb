class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :edit, :update, :destroy]

  # GET /artworks
  def index
    @artworks = Artwork.all
  end

  # GET /artworks/1
  def show
  end

  # GET /artworks/new
  def new
    @artwork = Artwork.new
  end

  # GET /artworks/1/edit
  def edit
  end

  # POST /artworks
  def create
    @artwork = Artwork.new(artwork_params)

    if @artwork.save
      redirect_to @artwork, notice: 'Artwork was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /artworks/1
  def update
    if @artwork.update(artwork_params)
      redirect_to @artwork, notice: 'Artwork was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /artworks/1
  def destroy
    @artwork.destroy
    redirect_to artworks_url, notice: 'Artwork was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artwork
      @artwork = Artwork.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def artwork_params
      params.require(:artwork).permit(:image, :artist_id, :title, :description, :dimensions_height, :dimensions_width, :medium_id, :mood_id, :prompt_id)
    end
end
