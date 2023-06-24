class Admin::UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(12)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :index
    end
  end

  private
    def user_params
      params.require(:user).permit(:is_deleted)
    end
end
