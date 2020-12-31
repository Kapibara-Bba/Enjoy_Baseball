class Team < ApplicationRecord

   has_many :infos, dependent: :destroy
   has_many :team_records, dependent: :destroy
   has_many :post_comments, dependent: :destroy
   has_many :users, dependent: :destroy

   include JpPrefecture
   attachment :team_image

   def team_address
      teamname + ' ' + prefecture_code + city
   end

   validates :teamname, presence: true
   validates :prefecture_code, presence: true
   validates :city, presence: true
   validates :team_address, presence: true

end
