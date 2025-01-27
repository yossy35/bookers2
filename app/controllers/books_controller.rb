class BooksController < ApplicationController
  def new
  end

  def show
    @user = current_user
    @book = Book.new
    @book = Book.find(params[:id])
  end

  def create
    @book.user_id = current_user.id
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "successfully"
      redirect_to book_path(@book.id) 
    else
      flash.now[:notice] = "error"
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image, :caption)
  end
end
