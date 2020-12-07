class Record < ApplicationRecord

    belongs_to :user

    attr_accessor :search_column

    def batter_average
      puts 'batter_average'
      puts self.hit
    end

    def batter_base
      puts 'batter_base'
    end

    # validates :search_column, presence: true
    # validates :search_column, inclusion: { in: ["batting","hit","homerun","two_base_hit",
    # "three_base_hit","dot","homein","strike_out","ball","bunt","sacrifice_fly","still","error"] }

end
