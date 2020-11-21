class Team < ApplicationRecord

   has_many :user, dependent: :destroy
  # belongs_to :user, optional: true

  validates :teamname, presence: true
end
