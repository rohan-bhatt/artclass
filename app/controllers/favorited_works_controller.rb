class FavoritedWorksController < ApplicationController
  before_action :set_favorited_work, only: %i[show edit update destroy]

  def index
    @q = FavoritedWork.ransack(params[:q])
    @favorited_works = @q.result(distinct: true).includes(:favoriter,
                                                          :artwork).page(params[:page]).per(10)
  end

  def show; end

  def new
    @favorited_work = FavoritedWork.new
  end

  def edit; end

  def create
    @favorited_work = FavoritedWork.new(favorited_work_params)

    if @favorited_work.save
      message = "FavoritedWork was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @favorited_work, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @favorited_work.update(favorited_work_params)
      redirect_to @favorited_work,
                  notice: "Favorited work was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @favorited_work.destroy
    message = "FavoritedWork was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to favorited_works_url, notice: message
    end
  end

  private

  def set_favorited_work
    @favorited_work = FavoritedWork.find(params[:id])
  end

  def favorited_work_params
    params.require(:favorited_work).permit(:artwork_id, :favoriter_id)
  end
end
