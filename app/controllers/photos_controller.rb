class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :update, :edit, :destroy]

  def index
    @photos = Photo.order("created_at DESC")
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to root_path
    else
      render :create
    end
  end

  def destroy
    @photo.destroy
    redirect_to request.referer
  end

  def show
  end


  private
  def photo_params
    params.require(:photo).permit(:title, :image, :description, :place_id)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
