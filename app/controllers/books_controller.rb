class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @pbook.save
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:book_name, :image, :caption)
  end
end
