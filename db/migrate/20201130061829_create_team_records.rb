class CreateTeamRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :team_records do |t|

      t.string :opponent
      t.integer :result
      t.date :days
      t.integer :score
      t.integer :team_id
      t.timestamps
    end
  end
end