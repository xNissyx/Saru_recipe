class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates_uniqueness_of :user_id, scope: :recipe_id
end
