class Post < ApplicationRecord

  belongs_to :user
  belongs_to :team

  attachment :image
  #mount_uploader :image, ImageUploader
end
