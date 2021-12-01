class Api::V1::FavoritedWorksController < Api::V1::GraphitiController
  def index
    favorited_works = FavoritedWorkResource.all(params)
    respond_with(favorited_works)
  end

  def show
    favorited_work = FavoritedWorkResource.find(params)
    respond_with(favorited_work)
  end

  def create
    favorited_work = FavoritedWorkResource.build(params)

    if favorited_work.save
      render jsonapi: favorited_work, status: 201
    else
      render jsonapi_errors: favorited_work
    end
  end

  def update
    favorited_work = FavoritedWorkResource.find(params)

    if favorited_work.update_attributes
      render jsonapi: favorited_work
    else
      render jsonapi_errors: favorited_work
    end
  end

  def destroy
    favorited_work = FavoritedWorkResource.find(params)

    if favorited_work.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: favorited_work
    end
  end
end
