class MoviesController < ApplicationController
    def upvote
      @counter += 1
      return @counter
    end
    
    def index
      @movie = Movie.all
    end

    def new
      @movie = Movie.new
    end

    def show
      @movie = Movie.find(params[:id])
      @movie.save
    end

    def create
      @movie = Movie.create
      if @movie.save
        redirect_to root_path
      else
        render :new
      end
    end

    def destroy
      @movie = Movie.find(params[:id]).destroy
      redirect_to movies_path
    end

    def edit
      @movie = Movie.find(params[:id])
    end

    def update
      @movie = Movie.find(params[:id])
      if @movie.update(movie_params)
        redirect_to movie_path(params[:id])
      else
        render :edit
      end
    end


    private

  def movie_params
    params.require(:movie).permit(:id, :name, :creator, :description)
  end
end
