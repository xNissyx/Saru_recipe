class RecipeTag < ApplicationRecord
  belongs_to :recipe
  belongs_to :tag

  validates_uniqueness_of :tag_id, scope: :recipe_id
end
