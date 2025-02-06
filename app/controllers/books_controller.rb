class BooksController < ApplicationController
  def new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @books = Book.all
    book = Book.new(book_params)
    book.user_id = current_user.id
    if book.save
      flash[:notice] = "successfully"
      redirect_to book_path(book.id)
    else
      @book = Book.new
      @user = current_user
      flash.now[:notice] = "error!"
      render :index
    end
  end

  def edit
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    if book.save
      flash[:notice] = "successfully"
      redirect_to book_path(book.id)
    else
      @book = Book.find(params[:id])
      flash.now[:notice] = "error"
      render :edit
    end
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
