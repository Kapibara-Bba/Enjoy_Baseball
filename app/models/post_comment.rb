class PostComment < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :team, optional: true
  has_many :notifications, foreign_key: 'post_comment_id', dependent: :destroy

  attachment :image

end
