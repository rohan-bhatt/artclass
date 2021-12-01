class Api::V1::MediumTypesController < Api::V1::GraphitiController
  def index
    medium_types = MediumTypeResource.all(params)
    respond_with(medium_types)
  end

  def show
    medium_type = MediumTypeResource.find(params)
    respond_with(medium_type)
  end

  def create
    medium_type = MediumTypeResource.build(params)

    if medium_type.save
      render jsonapi: medium_type, status: :created
    else
      render jsonapi_errors: medium_type
    end
  end

  def update
    medium_type = MediumTypeResource.find(params)

    if medium_type.update_attributes
      render jsonapi: medium_type
    else
      render jsonapi_errors: medium_type
    end
  end

  def destroy
    medium_type = MediumTypeResource.find(params)

    if medium_type.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: medium_type
    end
  end
end
