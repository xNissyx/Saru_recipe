class Recipe < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :recipe_tags
  has_many :tags, through: :recipe_tags
end
