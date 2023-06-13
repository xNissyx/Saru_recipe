class Recipe < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :calorie, numericality: { only_integer: true }, allow_nil: true
  
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :recipe_tags
  has_many :tags, through: :recipe_tags
  has_many :ingredients
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  has_one_attached :image
  
  def get_image
    if image.attached?
      image
    end
  end

end
