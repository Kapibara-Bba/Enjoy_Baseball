class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|

      t.string :comment
      t.integer :user_id
      t.integer :team_id
      t.string :image_id
      t.timestamps
    end
  end
end
