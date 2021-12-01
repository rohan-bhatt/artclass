class Api::V1::MoodsController < Api::V1::GraphitiController
  def index
    moods = MoodResource.all(params)
    respond_with(moods)
  end

  def show
    mood = MoodResource.find(params)
    respond_with(mood)
  end

  def create
    mood = MoodResource.build(params)

    if mood.save
      render jsonapi: mood, status: :created
    else
      render jsonapi_errors: mood
    end
  end

  def update
    mood = MoodResource.find(params)

    if mood.update_attributes
      render jsonapi: mood
    else
      render jsonapi_errors: mood
    end
  end

  def destroy
    mood = MoodResource.find(params)

    if mood.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: mood
    end
  end
end
