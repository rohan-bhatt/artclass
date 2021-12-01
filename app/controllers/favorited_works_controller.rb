class FavoritedWorksController < ApplicationController
  before_action :set_favorited_work, only: [:show, :edit, :update, :destroy]

  # GET /favorited_works
  def index
    @favorited_works = FavoritedWork.all
  end

  # GET /favorited_works/1
  def show
  end

  # GET /favorited_works/new
  def new
    @favorited_work = FavoritedWork.new
  end

  # GET /favorited_works/1/edit
  def edit
  end

  # POST /favorited_works
  def create
    @favorited_work = FavoritedWork.new(favorited_work_params)

    if @favorited_work.save
      message = 'FavoritedWork was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @favorited_work, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /favorited_works/1
  def update
    if @favorited_work.update(favorited_work_params)
      redirect_to @favorited_work, notice: 'Favorited work was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /favorited_works/1
  def destroy
    @favorited_work.destroy
    message = "FavoritedWork was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to favorited_works_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorited_work
      @favorited_work = FavoritedWork.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def favorited_work_params
      params.require(:favorited_work).permit(:artwork_id, :creator_id, :favoriter_id)
    end
end
