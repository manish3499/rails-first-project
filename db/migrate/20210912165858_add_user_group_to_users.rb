class AddUserGroupToUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :type, :string
    add_column :users, :user_group, :string
  end
end
