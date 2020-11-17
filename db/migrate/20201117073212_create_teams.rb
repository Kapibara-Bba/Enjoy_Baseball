class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :user_id
      t.string :teamname
      t.string :prefecture_code
      t.string :city
      t.string :team_image_id

      t.timestamps
    end
  end
end
