class AddUserToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :position, :integer
    add_column :users, :throw, :integer
    add_column :users, :image_id, :string
  end
end
