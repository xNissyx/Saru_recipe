# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def user_state
    @user = User.find_by(email: params[:user][:email])
    # アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user

    if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
      flash[:notice] = 'お客様は退会済みです。申し訳ございませんが、別のメールアドレスをお使いください。'
      redirect_to new_user_session_path
    end
  end
end
