class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
     @book = Book.find(params[:id])
  end

  def new
    @books = Book.all
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(book.id)
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
     redirect_to book_path(book.id)
    else
      render 'edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to new_book_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
