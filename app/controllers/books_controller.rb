class BooksController < ApplicationController
  
  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def new
    @book = Book.new
  end
  
  def edit
  end
  
  def create
    book = Book.new(book_params)
    book.save
    redirect_to "/books"
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def book_params
    params.permit(:title, :body)
  end
  
end
