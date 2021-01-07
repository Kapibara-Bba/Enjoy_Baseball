class Record < ApplicationRecord

    belongs_to :user
    attr_accessor :search_column

    validates :team_score, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :rival_score, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :bat, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :batting, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :hit, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :two_base_hit, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :three_base_hit, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :homerun, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :ball, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :strike_out, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :bunt, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :sacrifice_fly, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :dot, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :homein, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :still, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :error, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :win, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :lose, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :inning, presence: true, numericality: {greater_than_or_equal_to: 0}
    validates :to_be_homerun, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :to_be_strike_out, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :to_be_hit, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :to_be_ball, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :to_be_point, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
    validates :earned_run, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}

    def batter_average
      @batter_average = 0.000
    end

    def earned_run_average
      @earned_run_average = 0
    end
    # def batter_average
    #   puts 'batter_average'
    #   puts self.hit
    # end

    # def batter_base
    #   puts 'batter_base'
    # end


end
