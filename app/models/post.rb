class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image1, Image1Uploader
  mount_uploader :image2, Image2Uploader
  mount_uploader :image3, Image3Uploader
  mount_uploader :image4, Image4Uploader
  validates :content, presence: true, length: { maximum: 255 }
end
