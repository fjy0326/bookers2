class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
    unless current_user.id == @user.id
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
     redirect_to user_path(current_user.id)
    else 
     render :edit
   end
  end

  def index
    @users = User.all
    @user = User.find(current_user.id)
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end
