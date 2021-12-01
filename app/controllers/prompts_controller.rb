class PromptsController < ApplicationController
  before_action :set_prompt, only: [:show, :edit, :update, :destroy]

  # GET /prompts
  def index
    @prompts = Prompt.all
  end

  # GET /prompts/1
  def show
    @artwork = Artwork.new
  end

  # GET /prompts/new
  def new
    @prompt = Prompt.new
  end

  # GET /prompts/1/edit
  def edit
  end

  # POST /prompts
  def create
    @prompt = Prompt.new(prompt_params)

    if @prompt.save
      message = 'Prompt was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @prompt, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /prompts/1
  def update
    if @prompt.update(prompt_params)
      redirect_to @prompt, notice: 'Prompt was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /prompts/1
  def destroy
    @prompt.destroy
    message = "Prompt was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to prompts_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prompt
      @prompt = Prompt.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def prompt_params
      params.require(:prompt).permit(:title, :body, :artist_id)
    end
end
