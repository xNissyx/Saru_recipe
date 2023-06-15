class Public::HomesController < ApplicationController
  def top
    @tags = Tag.popular
    @recipes = Recipe.last(4).reverse
  end
end
