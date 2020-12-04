class Team < ApplicationRecord

   has_many :infos, dependent: :destroy
   has_many :team_records, dependent: :destroy
   has_many :posts, dependent: :destroy
   has_many :post_images, dependent: :destroy

   # belongs_to :user, optional: true
   include JpPrefecture

   validates :teamname, presence: true

   def team_address
      teamname + ' ' + prefecture_code + city
   end
end
