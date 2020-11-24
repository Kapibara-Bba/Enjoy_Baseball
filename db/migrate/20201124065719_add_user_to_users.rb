class AddUserToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :position, :string
    add_column :users, :throw, :string
  end
end
