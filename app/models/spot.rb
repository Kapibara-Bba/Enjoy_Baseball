class Spot < ApplicationRecord
  
  belongs_to :info
  
  geocoded_by :address
  after_validation :geocode
  
end
