class BooksController < ApplicationController
  
  def index
    @book = Book.new
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def new
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was succcessfully created."
      redirect_to "/books/#{book.id}"
    else
      render("books/index")
    end
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "Book was successufully updated."
    end
    redirect_to "/books/#{book.id}"
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
