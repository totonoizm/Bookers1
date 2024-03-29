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
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)#redirect_toはrouteを見にいく※更新するのと一緒
    else
      render 'new'#renderは設定したアクション内しか見ない※現在持っているデータを維持する
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @books = Book.all
    @book = Book.new
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:update] = "Book was successfully updated."
     redirect_to book_path(@book.id)
    else
      render 'edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:alert] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
