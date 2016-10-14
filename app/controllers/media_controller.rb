class MediaController < ApplicationController
  def upvote
    @media = Media.find(params[:id])
    @media.Votes.create
    redirect_to(media_path)
  end
  def index
    @medias = type.all
  end

  def new
    @media = type.new
  end

  def show
    @media = type.find(params[:id])
    @media.save
  end

  def create
    @media = type.create
    if @media.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @media = type.find(params[:id]).destroy
    redirect_to types_path
  end

  def edit
    @media = type.find(params[:id])
  end

  def update
    @media = type.find(params[:id])
    if @media.update(type_params)
      redirect_to type_path(params[:id])
    else
      render :edit
    end
  end


  private

  def type_params
    params.require(:type).permit(:id, :name, :creator, :description)
  end
end
