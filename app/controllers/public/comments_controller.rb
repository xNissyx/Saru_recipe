class Public::CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_recipe, only: [:create, :destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.recipe_id = @recipe.id
    if @comment.save
      respond_to :js
    else
      flash[:notice] = "コメント内容を入力してください"
      redirect_to recipe_path(@recipe)
    end
  end

  def destroy
    comment = @recipe.comments.find(params[:id])
    comment.destroy
    redirect_to recipe_path(@recipe)
  end

  private
  
  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
  
  def comment_params
    params.require(:comment).permit(:content, :score)
  end
end
