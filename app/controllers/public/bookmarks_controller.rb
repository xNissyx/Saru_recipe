class Public::BookmarksController < ApplicationController
  def create
    recipe = Recipe.find(params[:recipe_id])
    bookmark = current_user.bookmarks.new(recipe_id: recipe.id)
    if bookmark.save
      redirect_to recipe_path(recipe.id), notice: "ブックマークしました"
    else
      redirect_to recipe_path(recipe), notice: "ブックマーク失敗"
    end
  end
  
  def destroy
    recipe = Recipe.find(params[:recipe_id])
    bookmark = current_user.bookmarks.find_by(recipe_id: recipe.id)
    bookmark.destroy
    redirect_to recipe_path(recipe)
  end
end
