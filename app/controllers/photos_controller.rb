class PhotosController < ApplicationController
  before_action :authenticate!
  def index
    @photos = current_user.photos
  end
  def new
    
  end

  def create
    @photo = Photo.new(title: params[:title], user_id: current_user.id, image: params[:image])
    if @photo.save
      flash[:success] = "The photo was added!"
      redirect_to photos_path
    else
      render :new
    end
  end

end
