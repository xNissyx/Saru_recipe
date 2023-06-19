class Public::UsersController < ApplicationController
  def show
    @user = current_user
    @recipes = @user.bookmarking_recipes.includes(:user, image_attachment: :blob).page(params[:page]).per(9)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def guest_login
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def confirm
  end

  def withdraw
    current_user.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会に成功しました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
