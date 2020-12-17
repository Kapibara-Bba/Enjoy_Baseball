class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|

      t.integer :bat
      t.integer :batting
      t.integer :hit
      t.integer :two_base_hit
      t.integer :three_base_hit
      t.integer :homerun
      t.integer :strike_out
      t.integer :ball
      t.integer :bunt
      t.integer :dot
      t.integer :homein
      t.integer :sacrifice_fly
      t.integer :still
      t.integer :error
      t.integer :game
      t.integer :pitch_game
      t.integer :win
      t.integer :lose
      t.integer :inning
      t.integer :to_be_hit
      t.integer :to_be_homerun
      t.integer :to_be_strike_out
      t.integer :to_be_ball
      t.integer :to_be_point
      t.integer :earned_run
      t.string :opponent
      t.date :days
      t.integer :user_id
      t.timestamps
    end
  end
end


