class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def leave
    @user = User.find(params[:id])
  end

  def bye
    @user = User.new
    @user.save
    redirect_to "home/top"
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
