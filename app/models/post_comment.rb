class PostComment < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :team, optional: true
  has_many :notifications, dependent: :destroy

  attachment :image

end
