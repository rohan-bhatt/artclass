class ArtworksController < ApplicationController
  before_action :current_artist_must_be_artwork_artist,
                only: %i[edit update destroy]

  before_action :set_artwork, only: %i[show edit update destroy]

  # GET /artworks
  def index
    @q = Artwork.ransack(params[:q])
    @artworks = @q.result(distinct: true).includes(:artist, :prompt, :mood,
                                                   :favorites, :medium, :fans).page(params[:page]).per(10)
  end

  # GET /artworks/1
  def show
    @favorited_work = FavoritedWork.new
  end

  # GET /artworks/new
  def new
    @artwork = Artwork.new
  end

  # GET /artworks/1/edit
  def edit; end

  # POST /artworks
  def create
    @artwork = Artwork.new(artwork_params)

    if @artwork.save
      message = "Artwork was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @artwork, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /artworks/1
  def update
    if @artwork.update(artwork_params)
      redirect_to @artwork, notice: "Artwork was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /artworks/1
  def destroy
    @artwork.destroy
    message = "Artwork was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to artworks_url, notice: message
    end
  end

  private

  def current_artist_must_be_artwork_artist
    set_artwork
    unless current_artist == @artwork.artist
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_artwork
    @artwork = Artwork.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def artwork_params
    params.require(:artwork).permit(:image, :artist_id, :title, :description,
                                    :dimensions_height, :dimensions_width, :medium_id, :mood_id, :prompt_id)
  end
end
