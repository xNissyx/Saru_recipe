class Public::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    # N+1問題の解消
    @recipes = Recipe.includes(:user, image_attachment: :blob).all
  end

  def show
  end

  def new
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: 'レシピを作成しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: 'レシピを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'レシピを削除しました'
  end
  
  def search
    @recipes = Recipe.where('title LIKE ?', "%#{params[:word]}%")
  end
  
  def tag_search
    @tag = Tag.find(params[:tag_id])
    @recipes = @tag.recipes
  end

  private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:title, :description, :calorie, :user_id, :image, tag_ids: [], ingredients_attributes: [:id, :name, :quantity, :_destroy])
    end
end
