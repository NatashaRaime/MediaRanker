class BooksController < ApplicationController

    def index
      @book = Book.all
    end

    def new
      @book = Book.new
    end

    def show
      @book = Book.find(params[:id])
      @book.save
    end

    def create
      @book = Book.create
      if @book.save
        redirect_to root_path
      else
        render :new
      end
    end

    def destroy
      @book = Book.find(params[:id]).destroy
      redirect_to books_path
    end

    def edit
      @book = Book.find(params[:id])
    end

    def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to book_path(params[:id])
      else
        render :edit
      end
    end


    private

  def book_params
    params.require(:book).permit(:id, :name, :creator, :description)
  end
end
