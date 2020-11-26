class Team < ApplicationRecord

   has_many :infos, dependent: :destroy
   # belongs_to :user, optional: true

   validates :teamname, presence: true

   def team_address
      teamname + ' ' + prefecture_code + city
   end
end
