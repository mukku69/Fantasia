class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    redirect_to root_path
  end

  def quit_confirm
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end

end