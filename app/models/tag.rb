class Tag < ApplicationRecord
  validates :name, presence: true
  
  has_many :recipe_tags, dependent: :destroy
  has_many :recipes, through: :recipe_tags
  
  scope :popular, -> {
    select('tags.*, COUNT(recipes.id) as recipes_count')
    .joins(:recipes)
    .group('tags.id')
    .order('recipes_count DESC')
    .limit(10)
  }
end
