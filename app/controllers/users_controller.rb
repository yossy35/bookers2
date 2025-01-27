class UsersController < ApplicationController
  def show
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(user.id)
    else
      flash.now[:notice] = "error"
      render :edit
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end