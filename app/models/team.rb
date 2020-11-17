class Team < ApplicationRecord
  
  has_many :user, dependent: :destroy
  
end
