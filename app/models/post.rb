class Post < ApplicationRecord

  belongs_to :user
  belongs_to :team
  has_many :post_comments, dependent: :destroy
  has_many :post_images, dependent: :destroy

  attachment :image

end
