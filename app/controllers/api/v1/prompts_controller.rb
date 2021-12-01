class Api::V1::PromptsController < Api::V1::GraphitiController
  def index
    prompts = PromptResource.all(params)
    respond_with(prompts)
  end

  def show
    prompt = PromptResource.find(params)
    respond_with(prompt)
  end

  def create
    prompt = PromptResource.build(params)

    if prompt.save
      render jsonapi: prompt, status: 201
    else
      render jsonapi_errors: prompt
    end
  end

  def update
    prompt = PromptResource.find(params)

    if prompt.update_attributes
      render jsonapi: prompt
    else
      render jsonapi_errors: prompt
    end
  end

  def destroy
    prompt = PromptResource.find(params)

    if prompt.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: prompt
    end
  end
end
