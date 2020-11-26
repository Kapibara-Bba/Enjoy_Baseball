class CreateInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :infos do |t|

      t.string :body
      t.datetime :start_time
      t.integer :team_id
      t.timestamps
    end
  end
end
