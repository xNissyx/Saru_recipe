class Recipe < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :recipe_tags
  has_many :tags, through: :recipe_tags
  has_many :ingredients
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  
  # ActiveStorage用
  has_one_attached :image
  
  def get_image
    if image.attached?
      image
    else
    # Blobオブジェクトにしかvariantメソッドは使えないため、ここで変換している
      ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/no_image.jpg')), filename: 'no_image.jpg')
    end
  end
end
