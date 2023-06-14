class Admin::CommentsController < ApplicationController
  def index
    @comments = Comment.includes(:user, :recipe).page(params[:page]).per(12)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to admin_comments_path
  end
end
