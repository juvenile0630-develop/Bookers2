class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end
  def edit
    @user = User.find(params[:id])
    @book = Book.new
  end
  def update
    @user = User.find(params[:id])
    @book = Book.new
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id:params[:id])
  end

private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
