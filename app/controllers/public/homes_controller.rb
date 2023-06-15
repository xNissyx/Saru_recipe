class Public::HomesController < ApplicationController
  def top
    @tags = Tag.popular
    @recipes = Recipe.includes(image_attachment: :blob).order(id: :desc).limit(4)
  end
end
