class MoodsController < ApplicationController
  before_action :set_mood, only: %i[show edit update destroy]

  # GET /moods
  def index
    @q = Mood.ransack(params[:q])
    @moods = @q.result(distinct: true).includes(:artworks).page(params[:page]).per(10)
  end

  # GET /moods/1
  def show
    @artwork = Artwork.new
  end

  # GET /moods/new
  def new
    @mood = Mood.new
  end

  # GET /moods/1/edit
  def edit; end

  # POST /moods
  def create
    @mood = Mood.new(mood_params)

    if @mood.save
      redirect_to @mood, notice: "Mood was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /moods/1
  def update
    if @mood.update(mood_params)
      redirect_to @mood, notice: "Mood was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /moods/1
  def destroy
    @mood.destroy
    redirect_to moods_url, notice: "Mood was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mood
    @mood = Mood.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def mood_params
    params.require(:mood).permit(:mood)
  end
end
