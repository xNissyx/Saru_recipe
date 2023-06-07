class Recipe < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  # ActiveStorage用
  has_one_attached :image
  
   def get_image
    if image.attached?
      image
    else
      # ここで、デフォルトの画像をActiveStorageのアタッチメントとして返します
      ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join('app/assets/images/no_image.jpg')), filename: 'no_image.jpg')
    end
  end
end
