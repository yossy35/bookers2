class BooksController < ApplicationController
  def new
  end

  def show
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image, :caption)
  end
end
