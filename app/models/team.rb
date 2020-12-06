class Team < ApplicationRecord

   has_many :infos, dependent: :destroy
   has_many :team_records, dependent: :destroy
   has_many :posts, dependent: :destroy
   
   has_one :user
   include JpPrefecture

   validates :team, presence: true

   def team_address
      teamname + ' ' + prefecture_code + city
   end
end
