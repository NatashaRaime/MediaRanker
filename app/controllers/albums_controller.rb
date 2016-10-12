class AlbumsController < ApplicationController

  def index
    @album = Album.all
  end

  def new
    @album = Album.new
  end

  def show
    @album = Album.find(params[:id])
    @album.save
  end

  def create
    @album = Album.create
    if @album.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @album = Album.find(params[:id]).destroy
    redirect_to albums_path
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_path(params[:id])
    else
      render :edit
    end
  end


  private

  def album_params
    params.require(:album).permit(:id, :name, :creator, :description)
  end
end
