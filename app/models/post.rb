class Post < ApplicationRecord

  belongs_to :user
  belongs_to :team

  attachment :image

end
