class PromptsController < ApplicationController
  before_action :current_artist_must_be_prompt_prompter,
                only: %i[edit update destroy]

  before_action :set_prompt, only: %i[show edit update destroy]

  def index
    @q = Prompt.ransack(params[:q])
    @prompts = @q.result(distinct: true).includes(:prompter,
                                                  :artworks).page(params[:page]).per(10)
  end

  def show
    @artwork = Artwork.new
  end

  def new
    @prompt = Prompt.new
  end

  def edit; end

  def create
    @prompt = Prompt.new(prompt_params)

    if @prompt.save
      message = "Prompt was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @prompt, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @prompt.update(prompt_params)
      redirect_to @prompt, notice: "Prompt was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @prompt.destroy
    message = "Prompt was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to prompts_url, notice: message
    end
  end

  private

  def current_artist_must_be_prompt_prompter
    set_prompt
    unless current_artist == @prompt.prompter
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_prompt
    @prompt = Prompt.find(params[:id])
  end

  def prompt_params
    params.require(:prompt).permit(:title, :body, :artist_id)
  end
end
