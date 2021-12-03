class MoodsController < ApplicationController
  before_action :set_mood, only: %i[show edit update destroy]

  def index
    @q = Mood.ransack(params[:q])
    @moods = @q.result(distinct: true).includes(:artworks,
                                                :artists).page(params[:page]).per(10)
  end

  def show
    @artwork = Artwork.new
  end

  def new
    @mood = Mood.new
  end

  def edit; end

  def create
    @mood = Mood.new(mood_params)

    if @mood.save
      redirect_to @mood, notice: "Mood was successfully created."
    else
      render :new
    end
  end

  def update
    if @mood.update(mood_params)
      redirect_to @mood, notice: "Mood was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @mood.destroy
    redirect_to moods_url, notice: "Mood was successfully destroyed."
  end

  private

  def set_mood
    @mood = Mood.find(params[:id])
  end

  def mood_params
    params.require(:mood).permit(:mood)
  end
end
