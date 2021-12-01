class Api::V1::ArtworksController < Api::V1::GraphitiController
  def index
    artworks = ArtworkResource.all(params)
    respond_with(artworks)
  end

  def show
    artwork = ArtworkResource.find(params)
    respond_with(artwork)
  end

  def create
    artwork = ArtworkResource.build(params)

    if artwork.save
      render jsonapi: artwork, status: :created
    else
      render jsonapi_errors: artwork
    end
  end

  def update
    artwork = ArtworkResource.find(params)

    if artwork.update_attributes
      render jsonapi: artwork
    else
      render jsonapi_errors: artwork
    end
  end

  def destroy
    artwork = ArtworkResource.find(params)

    if artwork.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: artwork
    end
  end
end
